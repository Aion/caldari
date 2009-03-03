/* 
 * Copyright (C) 2005,2006,2007 MaNGOS <http://www.mangosproject.org/>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#include "Common.h"
#include "Database/DatabaseEnv.h"
#include "Log.h"
#include "WorldSession.h"
#include "WorldPacket.h"
#include "ObjectMgr.h"
#include "Pet.h"
#include "MapManager.h"
#include "Formulas.h"

char const* petTypeSuffix[MAX_PET_TYPE] =
{
    "'s Minion",                                            // SUMMON_PET
    "'s Pet",                                               // HUNTER_PET
    "'s Guardian",                                          // GUARDIAN_PET
    "'s Pet"                                                // MINI_PET
};

Pet::Pet(WorldObject *instantiator, PetType type) : Creature( instantiator )
{
    m_isPet = true;
    m_name = "Pet";
    m_petType = type;

    m_actState = STATE_RA_FOLLOW;
    if(type != GUARDIAN_PET)                                // guardian can't be in passive mode (owner can't changed mode for it)
        m_actState |= STATE_RA_PASSIVE;                     // hunter/summoned pet have this mode by default, minipets can only this mode always

    m_fealty = 0;
    m_petType = type;
    m_removed = false;
    m_regenTimer = 4000;
    for(uint32 i=0; i < CREATURE_MAX_SPELLS; i++)
        m_spells[i]=0;
}

Pet::~Pet()
{
    if(m_uint32Values)                                      // only for fully created Object
    {
        ObjectAccessor::Instance().RemovePet(this);
    }
}

bool Pet::LoadPetFromDB( Unit* owner, uint32 petentry, uint32 petnumber, bool current )
{
    uint32 ownerid = owner->GetGUIDLow();

    QueryResult *result;

    if(current)
        // current pet (slot 0)           0    1       2       3         4       5     6            7        8        9        10       11       12       13        14           15     16     17        18          19
        result = sDatabase.PQuery("SELECT `id`,`entry`,`owner`,`modelid`,`level`,`exp`,`nextlvlexp`,`spell1`,`spell2`,`spell3`,`spell4`,`action`,`fealty`,`loyalty`,`trainpoint`,`slot`,`name`,`renamed`,`curhealth`,`curmana`  FROM `character_pet` WHERE `owner` = '%u' AND `slot` = '0'",ownerid );
    else if(petnumber)
        // known petnumber entry          0    1       2       3         4       5     6            7        8        9        10       11       12       13        14           15        16     17     18          19
        result = sDatabase.PQuery("SELECT `id`,`entry`,`owner`,`modelid`,`level`,`exp`,`nextlvlexp`,`spell1`,`spell2`,`spell3`,`spell4`,`action`,`fealty`,`loyalty`,`trainpoint`,`slot`,`name`,`renamed`,`curhealth`,`curmana` FROM `character_pet` WHERE `owner` = '%u' AND `id` = '%u'",ownerid, petnumber);
    else if(petentry)
        // known petentry entry (unique for summoned pet, but non unique for hunter pet (only from current or not stabled pets)
        //                                0    1       2       3         4       5     6            7        8        9        10       11       12       13        14           15     16     17        18          19
        result = sDatabase.PQuery("SELECT `id`,`entry`,`owner`,`modelid`,`level`,`exp`,`nextlvlexp`,`spell1`,`spell2`,`spell3`,`spell4`,`action`,`fealty`,`loyalty`,`trainpoint`,`slot`,`name`,`renamed`,`curhealth`,`curmana`  FROM `character_pet` WHERE `owner` = '%u' AND `entry` = '%u' AND (`slot` = '0' OR `slot` = '3') ",ownerid, petentry );
    else
        // any current or other non-stabled pet (for hunter "call pet")
        //                                0    1       2       3         4       5     6            7        8        9        10       11       12       13        14           15     16     17        18          19
        result = sDatabase.PQuery("SELECT `id`,`entry`,`owner`,`modelid`,`level`,`exp`,`nextlvlexp`,`spell1`,`spell2`,`spell3`,`spell4`,`action`,`fealty`,`loyalty`,`trainpoint`,`slot`,`name`,`renamed`,`curhealth`,`curmana`  FROM `character_pet` WHERE `owner` = '%u' AND (`slot` = '0' OR `slot` = '3') ",ownerid);

    if(!result)
        return false;

    Field *fields = result->Fetch();

    // update for case of current pet "slot = 0"
    petentry = fields[1].GetUInt32();
    if(!petentry)
        return false;

    float px, py, pz;
    owner->GetClosePoint(NULL, px, py, pz,PET_FOLLOW_DIST,PET_FOLLOW_ANGLE);
    uint32 guid=objmgr.GenerateLowGuid(HIGHGUID_UNIT);
    if(!Create(guid, owner->GetMapId(), px, py, pz, owner->GetOrientation(), petentry))
    {
        delete result;
        return false;
    }

    SetUInt32Value(UNIT_FIELD_FACTIONTEMPLATE,owner->getFaction());

    CreatureInfo const *cinfo = GetCreatureInfo();
    if(cinfo->type == CREATURE_TYPE_CRITTER)
    {
        AIM_Initialize();
        AddToWorld();
        MapManager::Instance().GetMap(owner->GetMapId(), owner)->Add((Creature*)this);
        return true;
    }
    SetUInt32Value(UNIT_FIELD_PETNUMBER, fields[0].GetUInt32() );
    SetUInt64Value(UNIT_FIELD_SUMMONEDBY, owner->GetGUID());
    SetUInt64Value(UNIT_FIELD_DISPLAYID,       fields[3].GetUInt32());
    SetUInt64Value(UNIT_FIELD_NATIVEDISPLAYID, fields[3].GetUInt32());
    uint32 petlevel=fields[4].GetUInt32();
    SetUInt32Value(UNIT_NPC_FLAGS , 0);
    SetName(fields[16].GetString());

    switch(getPetType())
    {

        case SUMMON_PET:
            petlevel=owner->getLevel();

            SetUInt32Value(UNIT_FIELD_BYTES_0,2048);
            SetUInt32Value(UNIT_FIELD_FLAGS, UNIT_FLAG_UNKNOWN1);
                                                            // this enables popup window (pet dismiss, cancel)
            break;
        case HUNTER_PET:
            SetUInt32Value(UNIT_FIELD_BYTES_1,(fields[13].GetUInt32()<<8));
            SetUInt32Value(UNIT_FIELD_FLAGS, UNIT_FLAG_UNKNOWN1 + UNIT_FLAG_RESTING);
                                                            // this enables popup window (pet abandon, cancel)

            // pet not renamed yet, let rename if wont
            if(!fields[17].GetBool())
                SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_RENAME);

            SetUInt32Value(UNIT_MOD_CAST_SPEED, fields[14].GetUInt32() );
            SetUInt32Value(UNIT_TRAINING_POINTS, (getLevel()<<16) + getUsedTrainPoint() );
            SetMaxPower(POWER_HAPPINESS,1000000);
            SetPower(   POWER_HAPPINESS,fields[12].GetUInt32());
            setPowerType(POWER_FOCUS);
            break;
        default:
            sLog.outError("Pet have incorrect type (%u) for pet loading.",getPetType());
    }
    InitStatsForLevel( petlevel);
    SetUInt32Value(UNIT_FIELD_PET_NAME_TIMESTAMP,0);
    SetUInt32Value(UNIT_FIELD_PETEXPERIENCE, fields[5].GetUInt32());
    SetUInt32Value(UNIT_FIELD_PETNEXTLEVELEXP, fields[6].GetUInt32());
    SetUInt64Value(UNIT_FIELD_CREATEDBY, owner->GetGUID());

    m_fealty = fields[12].GetUInt32();

    m_spells[0] = fields[7].GetUInt32();
    m_spells[1] = fields[8].GetUInt32();
    m_spells[2] = fields[9].GetUInt32();
    m_spells[3] = fields[10].GetUInt32();
    m_actState  = fields[11].GetUInt32();

    uint32 health = fields[18].GetUInt32();
    if(health > GetMaxHealth())
    {
        sLog.outError("Pet %u have health (%u) in DB greater his max health value (%).",petnumber,health,GetMaxHealth());
    }
    else
        SetHealth(health);

    uint32 mana = fields[19].GetUInt32();
    if(mana > GetMaxPower(POWER_MANA))
    {
        sLog.outError("Pet %u have mana (%u) in DB greater his max mana value (%).",petnumber,mana,GetMaxPower(POWER_MANA));
    }
    else
        SetPower(POWER_MANA,mana);

    // set current pet as current
    if(fields[15].GetUInt32() != 0)
    {
        sDatabase.BeginTransaction();
        sDatabase.PExecute("UPDATE `character_pet` SET `slot` = '3' WHERE `owner` = '%u' AND `slot` = '0' AND `id` <> '%u'",ownerid, GetPetNumber());
        sDatabase.PExecute("UPDATE `character_pet` SET `slot` = '0' WHERE `owner` = '%u' AND `id` = '%u'",ownerid, GetPetNumber());
        sDatabase.CommitTransaction();
    }

    delete result;

    ObjectAccessor::Instance().AddPet(this);

    AIM_Initialize();
    AddToWorld();
    MapManager::Instance().GetMap(owner->GetMapId(), owner)->Add((Creature*)this);
    owner->SetPet(this);                                    // in DB stored only full controlled creature
    sLog.outDebug("New Pet has guid %u", GetGUIDLow());

    if(owner->GetTypeId() == TYPEID_PLAYER)
        ((Player*)owner)->PetSpellInitialize();

    return true;
}

void Pet::SavePetToDB(PetSaveMode mode)
{
    if(!GetEntry())
        return;

    // save only fully controlled creature
    if(!isControlled())
        return;

    switch(mode)
    {
        case PET_SAVE_AS_CURRENT:
        case PET_SAVE_IN_STABLE_SLOT_1:
        case PET_SAVE_IN_STABLE_SLOT_2:
        case PET_SAVE_NOT_IN_SLOT:
        {
            uint32 loyalty =1;
            if(getPetType()!=HUNTER_PET)
                loyalty = getloyalty();

            uint32 owner = GUID_LOPART(GetOwnerGUID());
            std::string name = m_name;
            sDatabase.escape_string(name);
            sDatabase.BeginTransaction();
            // remove current data
            sDatabase.PExecute("DELETE FROM `character_pet` WHERE `owner` = '%u' AND `id` = '%u'", owner,GetPetNumber() );

            // prevent duplicate using slot (except PET_SAVE_NOT_IN_SLOT)
            if(mode!=PET_SAVE_NOT_IN_SLOT)
                sDatabase.PExecute("UPDATE `character_pet` SET `slot` = 3 WHERE `owner` = '%u' AND `slot` = '%u'", owner, uint32(mode) );

            // prevent existence another hunter pet in PET_SAVE_AS_CURRENT and PET_SAVE_NOT_IN_SLOT
            if(getPetType()==HUNTER_PET && (mode==PET_SAVE_AS_CURRENT||mode==PET_SAVE_NOT_IN_SLOT))
                sDatabase.PExecute("DELETE FROM `character_pet` WHERE `owner` = '%u' AND (`slot` = '0' OR `slot` = '3')", owner );
            // save pet
            sDatabase.PExecute("INSERT INTO `character_pet` (`id`,`entry`,`owner`,`modelid`,`level`,`exp`,`nextlvlexp`,`spell1`,`spell2`,`spell3`,`spell4`,`action`,`fealty`,`loyalty`,`trainpoint`,`name`,`renamed`,`slot`,`curhealth`,`curmana`) "
                "VALUES (%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,'%s','%u','%u','%u','%u')",
                GetPetNumber(),GetEntry(), owner, GetUInt32Value(UNIT_FIELD_DISPLAYID), getLevel(), GetUInt32Value(UNIT_FIELD_PETEXPERIENCE), GetUInt32Value(UNIT_FIELD_PETNEXTLEVELEXP),
                m_spells[0], m_spells[1], m_spells[2], m_spells[3], m_actState, GetPower(POWER_HAPPINESS),getloyalty(),getUsedTrainPoint(), name.c_str(),
                uint32(HasFlag(UNIT_FIELD_FLAGS,UNIT_FLAG_RENAME)?0:1),uint32(mode),(GetHealth()<1?1:GetHealth()),GetPower(POWER_MANA));
            sDatabase.CommitTransaction();
            break;
        }
        case PET_SAVE_AS_DELETED:
        {
            uint32 owner = GUID_LOPART(GetOwnerGUID());
            sDatabase.PExecute("DELETE FROM `character_pet` WHERE `owner` = '%u' AND `id` = '%u'", owner,GetPetNumber());
            break;
        }
        default:
            sLog.outError("Unknown pet save/remove mode: %d",mode);
    }
}

/*void Pet::SendPetQuery()
{
    Unit *player = GetOwner();
    if(player->GetTypeId() != TYPEID_PLAYER)
        return;
    char *subname = "Pet";
    CreatureInfo *ci = objmgr.GetCreatureTemplate(GetEntry());

    WorldPacket data;
    data.Initialize( SMSG_CREATURE_QUERY_RESPONSE );
    data << (uint32)GetEntry();
    data << m_name.c_str();
    data << uint8(0) << uint8(0) << uint8(0);
    data << subname;

    uint32 wdbFeild11=0,wdbFeild12=0;

    data << ci->flag1;                                      //flags          wdbFeild7=wad flags1
    data << uint32(ci->type);                               //creatureType   wdbFeild8
    data << (uint32)ci->family;                             //family         wdbFeild9
    data << (uint32)ci->rank;                               //rank           wdbFeild10
    data << (uint32)wdbFeild11;                             //unknow         wdbFeild11
    data << (uint32)wdbFeild12;                             //unknow         wdbFeild12
    data << ci->DisplayID;                                  //DisplayID      wdbFeild13

    data << (uint16)ci->civilian;                           //wdbFeild14

    player->GetSession()->SendPacket( &data );
}
*/

void Pet::setDeathState(DeathState s)                       // overwrite virtual Creature::setDeathState and Unit::setDeathState
{
    Creature::setDeathState(s);
    if(getDeathState()==CORPSE)
    {
        //remove summoned pet (no corpse)
        if(getPetType()==SUMMON_PET)
            Remove(PET_SAVE_NOT_IN_SLOT);
        // other will despawn at corpse desppawning (Pet::Update code)
        else
        {
            // pet corpse non lootable and non skinnable
            SetUInt32Value( UNIT_DYNAMIC_FLAGS, 0x00 );
            RemoveFlag (UNIT_FIELD_FLAGS, UNIT_FLAG_SKINNABLE);
        }
    }
}

void Pet::Update(uint32 diff)
{
    if(m_removed)                                           // pet already removed, just wait in remove queue, no updates
        return;

    switch( m_deathState )
    {
        case CORPSE:
        {
            if( m_deathTimer <= diff )
            {
                assert(getPetType()!=SUMMON_PET && "Must be already removed.");
                Remove(PET_SAVE_NOT_IN_SLOT);               //hunters' pets never get removed because of death, NEVER!
                return;
            }
            break;
        }
        case ALIVE:
        {
            // unsummon pet that lost owner
            Unit* owner = GetOwner();
            if(!owner || !IsWithinDistInMap(owner, OWNER_MAX_DISTANCE) || isControlled() && !owner->GetPetGUID())
            {
                Remove(PET_SAVE_NOT_IN_SLOT);
                return;
            }

            if(isControlled())
            {
                if( owner->GetPetGUID() != GetGUID() )
                {
                    Remove(getPetType()==HUNTER_PET?PET_SAVE_AS_DELETED:PET_SAVE_NOT_IN_SLOT);
                    return;
                }
            }
            else
            {
                if(m_duration > 0)
                {
                    if(m_duration > diff)
                        m_duration -= diff;
                    else
                    {
                        Remove(PET_SAVE_AS_DELETED);
                        return;
                    }
                }
            }

            //regenerate Focus
            if(m_regenTimer > 0)
            {
                if(m_regenTimer > diff)
                    m_regenTimer = 0;
                else
                    m_regenTimer -= diff;
            }
            else
            {
                RegenerateFocus();
                m_regenTimer = 4000;
            }

            break;
        }
        default:
            break;
    }
    Creature::Update(diff);
}

void Pet::RegenerateFocus()
{
    uint32 curValue = GetPower(POWER_FOCUS);
    uint32 maxValue = GetMaxPower(POWER_FOCUS);
    if (curValue >= maxValue) return;
    uint32 addvalue = 25;
    ModifyPower(POWER_FOCUS, addvalue);
}

void Pet::Remove(PetSaveMode mode)
{
    Unit* owner = GetOwner();

    if(owner)
    {
        if(owner->GetTypeId()==TYPEID_PLAYER)
        {
            ((Player*)owner)->RemovePet(this,mode);
            return;
        }

        // only if current pet in slot
        if(owner->GetPetGUID()==GetGUID())
            owner->SetPet(0);
    }

    CleanupCrossRefsBeforeDelete();
    ObjectAccessor::Instance().AddObjectToRemoveList(this);
    m_removed = true;
}

void Pet::GivePetXP(uint32 xp)
{
    if(getPetType() != HUNTER_PET)
        return;

    if ( xp < 1 )
        return;

    if(!isAlive())
        return;

    uint32 level = getLevel();

    // XP to money conversion processed in Player::RewardQuest
    if(level >= sWorld.getConfig(CONFIG_MAX_PLAYER_LEVEL))
        return;

    uint32 curXP = GetUInt32Value(UNIT_FIELD_PETEXPERIENCE);
    uint32 nextLvlXP = GetUInt32Value(UNIT_FIELD_PETNEXTLEVELEXP);
    uint32 newXP = curXP + xp;

    if(newXP >= nextLvlXP && level+1 > GetOwner()->getLevel())
    {
        SetUInt32Value(UNIT_FIELD_PETEXPERIENCE, nextLvlXP-1);
        return;
    }

    while( newXP >= nextLvlXP && level < sWorld.getConfig(CONFIG_MAX_PLAYER_LEVEL) )
    {
        newXP -= nextLvlXP;

        SetLevel( level + 1 );
        SetUInt32Value(UNIT_FIELD_PETNEXTLEVELEXP, uint32((MaNGOS::XP::xp_to_level(level+1))/4));

        level = getLevel();
        nextLvlXP = GetUInt32Value(UNIT_FIELD_PETNEXTLEVELEXP);
        GivePetLevel(level);
    }

    SetUInt32Value(UNIT_FIELD_PETEXPERIENCE, newXP);
}

void Pet::GivePetLevel(uint32 level)
{
    if(!level)
        return;
    uint32 loyalty = 1;
    CreatureInfo const *cinfo = GetCreatureInfo();
    // pet damage will grow up with the pet level,*1.5f for temp
    InitStatsForLevel( level);
    SetUInt32Value(UNIT_TRAINING_POINTS, (level<<16) + getUsedTrainPoint());
    SetUInt32Value(UNIT_FIELD_BYTES_1,(getloyalty()<<8));

    if(level - cinfo->minlevel >= 21)
        loyalty = 7;
    else if(level - cinfo->minlevel >= 15)
        loyalty = 6;
    else if(level - cinfo->minlevel >= 10)
        loyalty = 5;
    else if(level - cinfo->minlevel >= 6)
        loyalty = 4;
    else if(level - cinfo->minlevel >= 3)
        loyalty = 3;
    else if(level - cinfo->minlevel >= 1)
        loyalty = 2;
    SetUInt32Value(UNIT_FIELD_BYTES_1,(loyalty << 8));
}

bool Pet::CreateBaseAtCreature(Creature* creature)
{
    uint32 guid=objmgr.GenerateLowGuid(HIGHGUID_UNIT);

    SetInstanceId(creature->GetInstanceId());

    Create(guid, creature->GetMapId(), creature->GetPositionX(), creature->GetPositionY(), creature->GetPositionZ(), creature->GetOrientation(), creature->GetEntry());

    CreatureInfo const *cinfo = GetCreatureInfo();
    if(cinfo->type == CREATURE_TYPE_CRITTER)
    {
        m_petType = MINI_PET;
        return true;
    }
    SetUInt64Value(UNIT_FIELD_DISPLAYID,       creature->GetUInt64Value(UNIT_FIELD_DISPLAYID));
    SetUInt64Value(UNIT_FIELD_NATIVEDISPLAYID, creature->GetUInt64Value(UNIT_FIELD_NATIVEDISPLAYID));
    uint32 petlevel=creature->getLevel();
    SetUInt32Value(UNIT_NPC_FLAGS , 0);
    SetName(creature->GetName());
    if(cinfo->type == CREATURE_TYPE_BEAST)
    {
        SetUInt32Value(UNIT_FIELD_BYTES_1,creature->GetUInt32Value(UNIT_FIELD_BYTES_1));

        SetUInt32Value(UNIT_MOD_CAST_SPEED, creature->GetUInt32Value(UNIT_MOD_CAST_SPEED) );
        SetUInt32Value(UNIT_TRAINING_POINTS, (getLevel()<<16) + getUsedTrainPoint() );
    }
    InitStatsForLevel( petlevel);

    m_fealty = 0;

    m_spells[0] = creature->m_spells[0];
    m_spells[1] = creature->m_spells[1];
    m_spells[2] = creature->m_spells[2];
    m_spells[3] = creature->m_spells[3];
    return true;
}

void Pet::InitStatsForLevel(uint32 petlevel)
{
    CreatureInfo const *cinfo = GetCreatureInfo();
    assert(cinfo);

    SetLevel( petlevel);

    SetArmor(petlevel*50);

    switch(getPetType())
    {
        case HUNTER_PET:
            // remove elite bonuses included in DB values
            SetMaxHealth(((cinfo->maxhealth / cinfo->maxlevel) / (1 + 2 * cinfo->rank)) * petlevel);
            SetMaxPower(POWER_MANA, ((cinfo->maxmana / cinfo->maxlevel) / (1 + 2 * cinfo->rank)) * petlevel);

            // remove elite bonuses included in DB values
            SetFloatValue(UNIT_FIELD_MINDAMAGE, (cinfo->mindmg / (1 + 2 * cinfo->rank)) + float(petlevel-cinfo->minlevel)*1.5f);
            SetFloatValue(UNIT_FIELD_MAXDAMAGE, (cinfo->maxdmg / (1 + 2 * cinfo->rank)) + float(petlevel-cinfo->minlevel)*1.5f);

            SetStat(STAT_STRENGTH,uint32(20+petlevel*1.55));
            SetStat(STAT_AGILITY,uint32(20+petlevel*0.64));
            SetStat(STAT_STAMINA,uint32(20+petlevel*1.27));
            SetStat(STAT_INTELLECT,uint32(20+petlevel*0.18));
            SetStat(STAT_SPIRIT,uint32(20+petlevel*0.36));
            break;
        case SUMMON_PET:
        {
            PetLevelInfo const* pInfo = objmgr.GetPetLevelInfo(cinfo->Entry,petlevel);
            if(pInfo)                                       // exist in DB
            {
                SetMaxHealth(pInfo->health);
                SetMaxPower(POWER_MANA, pInfo->mana);

                for(int stat = 0; stat < MAX_STATS; ++stat)
                    SetStat(Stats(stat),pInfo->stats[stat]);
            }
            else                                            // not exist in DB, use some default fake data
            {
                sLog.outErrorDb("Summoned pet (Entry: %u) not have pet stats data in DB",cinfo->Entry);

                // remove elite bonuses included in DB values
                SetMaxHealth(((cinfo->maxhealth / cinfo->maxlevel) / (1 + 2 * cinfo->rank)) * petlevel);
                SetMaxPower(POWER_MANA, ((cinfo->maxmana / cinfo->maxlevel) / (1 + 2 * cinfo->rank)) * petlevel);

                SetStat(STAT_STRENGTH,22);
                SetStat(STAT_AGILITY,22);
                SetStat(STAT_STAMINA,25);
                SetStat(STAT_INTELLECT,28);
                SetStat(STAT_SPIRIT,27);
            }
        };  break;
        default:
            sLog.outError("Pet have incorrect type (%u) for levelup.",getPetType());
            break;
    }

    SetHealth(GetMaxHealth());
    SetPower(POWER_MANA, GetMaxPower(POWER_MANA));
}

bool Pet::HaveInDiet(ItemPrototype const* item) const
{
    CreatureInfo const* cInfo = GetCreatureInfo();
    if(!cInfo)
        return false;

    CreatureFamilyEntry const* cFamily = sCreatureFamilyStore.LookupEntry(cInfo->family);
    if(!cFamily)
        return false;

    // all (?) pet food is in trade goods or consumable class
    if( item->Class != ITEM_CLASS_TRADE_GOODS && item->Class != ITEM_CLASS_CONSUMABLE ||
        item->Class == ITEM_CLASS_TRADE_GOODS && item->SubClass != ITEM_SUBCLASS_TRADE_GOODS ||
        item->Class == ITEM_CLASS_CONSUMABLE  && item->SubClass != 0 && item->SubClass != ITEM_SUBCLASS_FOOD )
        return false;

    // FIXME: food type check not implemented
    return true;

    /*
    uint32 diet = cFamily->petFoodMask;

    if(diet & PET_DIET_MEAT)
    {
    }

    if(diet & PET_DIET_FISH)
    {
    }

    if(diet & PET_DIET_CHEESE)
    {
    }

    if(diet & PET_DIET_BREAD)
    {
    }

    if(diet & PET_DIET_FUNGAS)
    {
    }

    if(diet & PET_DIET_FRUIT)
    {
    }

    if(diet & PET_DIET_RAW_MEAT)
    {
    }

    if(diet & PET_DIET_RAW_FISH)
    {
    }

    return false;
    */
}
