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

#ifndef MANGOS_SHAREDDEFINES_H
#define MANGOS_SHAREDDEFINES_H

enum Gender
{
    GENDER_MALE                        = 0,
    GENDER_FEMALE                      = 1,
    GENDER_NONE                        = 2
};

// Race value is index in ChrRaces.dbc
enum Races
{
    RACE_HUMAN          = 1,
    RACE_ORC            = 2,
    RACE_DWARF          = 3,
    RACE_NIGHTELF       = 4,
    // if it needs be to official, it's actually SCOURGE acording to the story/.dbc
    RACE_UNDEAD_PLAYER  = 5,
    RACE_TAUREN         = 6,
    RACE_GNOME          = 7,
    RACE_TROLL          = 8,
    MAX_RACES           = 9,
    // officially, this exists but was never taken into use.. neutral faction which could
    // learn some skills/spells from horde/alliance. maybe it'll be of some use later on.
    RACE_GOBLIN = 9
};

// Class value is index in ChrClasses.dbc
enum Classes
{
    CLASS_WARRIOR   = 1,
    CLASS_PALADIN   = 2,
    CLASS_HUNTER    = 3,
    CLASS_ROGUE     = 4,
    CLASS_PRIEST    = 5,
    // CLASS_UNK1   = 6, unused
    CLASS_SHAMAN    = 7,
    CLASS_MAGE      = 8,
    CLASS_WARLOCK   = 9,
    // CLASS_UNK2   = 10,unused
    CLASS_DRUID     = 11,
    MAX_CLASSES     = 12
};

enum ReputationRank
{
    REP_HATED       = 0,
    REP_HOSTILE     = 1,
    REP_UNFRIENDLY  = 2,
    REP_NEUTRAL     = 3,
    REP_FRIENDLY    = 4,
    REP_HONORED     = 5,
    REP_REVERTED    = 6,
    REP_EXALTED     = 7
};

#define MIN_REPUTATION_RANK (REP_HATED)
#define MAX_REPUTATION_RANK 8

enum MapTypes
{
    MAP_COMMON          = 0,
    MAP_INSTANCE        = 1,
    MAP_RAID            = 2,
    MAP_BATTLEGROUND    = 3,
};

enum MoneyConstants
{
    COPPER = 1,
    SILVER = COPPER*100,
    GOLD   = SILVER*100
};

enum Stats
{
    STAT_STRENGTH                      = 0,
    STAT_AGILITY                       = 1,
    STAT_STAMINA                       = 2,
    STAT_INTELLECT                     = 3,
    STAT_SPIRIT                        = 4
};

#define MAX_STATS                        5

enum Powers
{
    POWER_MANA                         = 0,
    POWER_RAGE                         = 1,
    POWER_FOCUS                        = 2,
    POWER_ENERGY                       = 3,
    POWER_HAPPINESS                    = 4
};

#define MAX_POWERS                       5

enum SpellSchools
{
    SPELL_SCHOOL_NORMAL                = 0,
    SPELL_SCHOOL_HOLY                  = 1,
    SPELL_SCHOOL_FIRE                  = 2,
    SPELL_SCHOOL_NATURE                = 3,
    SPELL_SCHOOL_FROST                 = 4,
    SPELL_SCHOOL_SHADOW                = 5,
    SPELL_SCHOOL_ARCANE                = 6
};

#define MAX_SPELL_SCHOOL                 7

enum ItemQuelities
{
    ITEM_QUALITY_POOR                  = 0,                 //GREY
    ITEM_QUALITY_NORMAL                = 1,                 //WHITE
    ITEM_QUALITY_UNCOMMON              = 2,                 //GREEN
    ITEM_QUALITY_RARE                  = 3,                 //BLUE
    ITEM_QUALITY_EPIC                  = 4,                 //PURPLE
    ITEM_QUALITY_LEGENDARY             = 5,                 //ORANGE
    ITEM_QUALITY_ARTIFACT              = 6                  //LIGHT YELLOW
};

enum sheathTypes
{
    SHEATHETYPE_NONE                   = 0,
    SHEATHETYPE_MAINHAND               = 1,
    SHEATHETYPE_OFFHAND                = 2,
    SHEATHETYPE_LARGEWEAPONLEFT        = 3,
    SHEATHETYPE_LARGEWEAPONRIGHT       = 4,
    SHEATHETYPE_HIPWEAPONLEFT          = 5,
    SHEATHETYPE_HIPWEAPONRIGHT         = 6,
    SHEATHETYPE_SHIELD                 = 7
};

enum CharacterSlot
{
    SLOT_HEAD                          = 0,
    SLOT_NECK                          = 1,
    SLOT_SHOULDERS                     = 2,
    SLOT_SHIRT                         = 3,
    SLOT_CHEST                         = 4,
    SLOT_WAIST                         = 5,
    SLOT_LEGS                          = 6,
    SLOT_FEET                          = 7,
    SLOT_WRISTS                        = 8,
    SLOT_HANDS                         = 9,
    SLOT_FINGER1                       = 10,
    SLOT_FINGER2                       = 11,
    SLOT_TRINKET1                      = 12,
    SLOT_TRINKET2                      = 13,
    SLOT_BACK                          = 14,
    SLOT_MAIN_HAND                     = 15,
    SLOT_OFF_HAND                      = 16,
    SLOT_RANGED                        = 17,
    SLOT_TABARD                        = 18,
    SLOT_EMPTY                         = 19
};

enum Language
{
    LANG_GLOBAL         = 0, LANG_UNIVERSAL      = 0,
    LANG_ORCISH         = 1,
    LANG_DARNASSIAN     = 2,
    LANG_TAURAHE        = 3,
    LANG_DWARVISH       = 6,
    LANG_COMMON         = 7,
    LANG_DEMONIC        = 8,
    LANG_TITAN          = 9,
    LANG_THELASSIAN     = 10,
    LANG_DRACONIC       = 11,
    LANG_KALIMAG        = 12,
    LANG_GNOMISH        = 13,
    LANG_TROLL          = 14,
    LANG_GUTTERSPEAK    = 33
};

#define LANGUAGES_COUNT 15

enum Team
{
    ALLIANCE = 469,
    HORDE = 67,
    ALLIANCE_FORCES = 891,
    HORDE_FORCES = 892,
    STEAMWHEEDLE_CARTEL = 169,
};

enum SpellEffects
{
    SPELL_EFFECT_INSTAKILL                 = 1,
    SPELL_EFFECT_SCHOOL_DAMAGE             = 2,
    SPELL_EFFECT_DUMMY                     = 3,
    SPELL_EFFECT_PORTAL_TELEPORT           = 4,
    SPELL_EFFECT_TELEPORT_UNITS            = 5,
    SPELL_EFFECT_APPLY_AURA                = 6,
    SPELL_EFFECT_ENVIRONMENTAL_DAMAGE      = 7,
    SPELL_EFFECT_MANA_DRAIN                = 8,
    SPELL_EFFECT_HEALTH_LEECH              = 9,
    SPELL_EFFECT_HEAL                      = 10,
    SPELL_EFFECT_BIND                      = 11,
    SPELL_EFFECT_PORTAL                    = 12,
    SPELL_EFFECT_RITUAL_BASE               = 13,
    SPELL_EFFECT_RITUAL_SPECIALIZE         = 14,
    SPELL_EFFECT_RITUAL_ACTIVATE_PORTAL    = 15,
    SPELL_EFFECT_QUEST_COMPLETE            = 16,
    SPELL_EFFECT_WEAPON_DAMAGE_NOSCHOOL    = 17,
    SPELL_EFFECT_RESURRECT                 = 18,
    SPELL_EFFECT_ADD_EXTRA_ATTACKS         = 19,
    SPELL_EFFECT_DODGE                     = 20,
    SPELL_EFFECT_EVADE                     = 21,
    SPELL_EFFECT_PARRY                     = 22,
    SPELL_EFFECT_BLOCK                     = 23,
    SPELL_EFFECT_CREATE_ITEM               = 24,
    SPELL_EFFECT_WEAPON                    = 25,
    SPELL_EFFECT_DEFENSE                   = 26,
    SPELL_EFFECT_PERSISTENT_AREA_AURA      = 27,
    SPELL_EFFECT_SUMMON                    = 28,
    SPELL_EFFECT_LEAP                      = 29,
    SPELL_EFFECT_ENERGIZE                  = 30,
    SPELL_EFFECT_WEAPON_PERCENT_DAMAGE     = 31,
    SPELL_EFFECT_TRIGGER_MISSILE           = 32,
    SPELL_EFFECT_OPEN_LOCK                 = 33,
    SPELL_EFFECT_SUMMON_CHANGE_ITEM        = 34,
    SPELL_EFFECT_APPLY_AREA_AURA           = 35,
    SPELL_EFFECT_LEARN_SPELL               = 36,
    SPELL_EFFECT_SPELL_DEFENSE             = 37,
    SPELL_EFFECT_DISPEL                    = 38,
    SPELL_EFFECT_LANGUAGE                  = 39,
    SPELL_EFFECT_DUAL_WIELD                = 40,
    SPELL_EFFECT_SUMMON_WILD               = 41,
    SPELL_EFFECT_SUMMON_GUARDIAN           = 42,
    SPELL_EFFECT_TELEPORT_UNITS_FACE_CASTER= 43,
    SPELL_EFFECT_SKILL_STEP                = 44,
    SPELL_EFFECT_UNDEFINED_45              = 45,
    SPELL_EFFECT_SPAWN                     = 46,
    SPELL_EFFECT_TRADE_SKILL               = 47,
    SPELL_EFFECT_STEALTH                   = 48,
    SPELL_EFFECT_DETECT                    = 49,
    //    SPELL_EFFECT_SUMMON_OBJECT             = 50,
    SPELL_EFFECT_TRANS_DOOR                = 50,
    SPELL_EFFECT_FORCE_CRITICAL_HIT        = 51,
    SPELL_EFFECT_GUARANTEE_HIT             = 52,
    SPELL_EFFECT_ENCHANT_ITEM              = 53,
    SPELL_EFFECT_ENCHANT_ITEM_TEMPORARY    = 54,
    SPELL_EFFECT_TAMECREATURE              = 55,
    SPELL_EFFECT_SUMMON_PET                = 56,
    SPELL_EFFECT_LEARN_PET_SPELL           = 57,
    SPELL_EFFECT_WEAPON_DAMAGE             = 58,
    SPELL_EFFECT_OPEN_LOCK_ITEM            = 59,
    SPELL_EFFECT_PROFICIENCY               = 60,
    SPELL_EFFECT_SEND_EVENT                = 61,
    SPELL_EFFECT_POWER_BURN                = 62,
    SPELL_EFFECT_THREAT                    = 63,
    SPELL_EFFECT_TRIGGER_SPELL             = 64,
    SPELL_EFFECT_HEALTH_FUNNEL             = 65,
    SPELL_EFFECT_POWER_FUNNEL              = 66,
    SPELL_EFFECT_HEAL_MAX_HEALTH           = 67,
    SPELL_EFFECT_INTERRUPT_CAST            = 68,
    SPELL_EFFECT_DISTRACT                  = 69,
    SPELL_EFFECT_PULL                      = 70,
    SPELL_EFFECT_PICKPOCKET                = 71,
    SPELL_EFFECT_ADD_FARSIGHT              = 72,
    SPELL_EFFECT_SUMMON_POSSESSED          = 73,
    SPELL_EFFECT_SUMMON_TOTEM              = 74,
    SPELL_EFFECT_HEAL_MECHANICAL           = 75,
    SPELL_EFFECT_SUMMON_OBJECT_WILD        = 76,
    SPELL_EFFECT_SCRIPT_EFFECT             = 77,
    SPELL_EFFECT_ATTACK                    = 78,
    SPELL_EFFECT_SANCTUARY                 = 79,
    SPELL_EFFECT_ADD_COMBO_POINTS          = 80,
    SPELL_EFFECT_CREATE_HOUSE              = 81,
    SPELL_EFFECT_BIND_SIGHT                = 82,
    SPELL_EFFECT_DUEL                      = 83,
    SPELL_EFFECT_STUCK                     = 84,
    SPELL_EFFECT_SUMMON_PLAYER             = 85,
    SPELL_EFFECT_ACTIVATE_OBJECT           = 86,
    SPELL_EFFECT_SUMMON_TOTEM_SLOT1        = 87,
    SPELL_EFFECT_SUMMON_TOTEM_SLOT2        = 88,
    SPELL_EFFECT_SUMMON_TOTEM_SLOT3        = 89,
    SPELL_EFFECT_SUMMON_TOTEM_SLOT4        = 90,
    SPELL_EFFECT_THREAT_ALL                = 91,
    SPELL_EFFECT_ENCHANT_HELD_ITEM         = 92,
    SPELL_EFFECT_SUMMON_PHANTASM           = 93,
    SPELL_EFFECT_SELF_RESURRECT            = 94,
    SPELL_EFFECT_SKINNING                  = 95,
    SPELL_EFFECT_CHARGE                    = 96,
    SPELL_EFFECT_SUMMON_CRITTER            = 97,
    SPELL_EFFECT_KNOCK_BACK                = 98,
    SPELL_EFFECT_DISENCHANT                = 99,
    SPELL_EFFECT_INEBRIATE                 = 100,
    SPELL_EFFECT_FEED_PET                  = 101,
    SPELL_EFFECT_DISMISS_PET               = 102,
    SPELL_EFFECT_REPUTATION                = 103,
    SPELL_EFFECT_SUMMON_OBJECT_SLOT1       = 104,
    SPELL_EFFECT_SUMMON_OBJECT_SLOT2       = 105,
    SPELL_EFFECT_SUMMON_OBJECT_SLOT3       = 106,
    SPELL_EFFECT_SUMMON_OBJECT_SLOT4       = 107,
    SPELL_EFFECT_DISPEL_MECHANIC           = 108,
    SPELL_EFFECT_SUMMON_DEAD_PET           = 109,
    SPELL_EFFECT_DESTROY_ALL_TOTEMS        = 110,
    SPELL_EFFECT_DURABILITY_DAMAGE         = 111,
    SPELL_EFFECT_SUMMON_DEMON              = 112,
    SPELL_EFFECT_RESURRECT_NEW             = 113,
    SPELL_EFFECT_ATTACK_ME                 = 114,
    SPELL_EFFECT_DURABILITY_DAMAGE_PCT     = 115,
    SPELL_EFFECT_SKIN_PLAYER_CORPSE        = 116,
    SPELL_EFFECT_SPIRIT_HEAL               = 117,
    SPELL_EFFECT_SKILL                     = 118,
    SPELL_EFFECT_APPLY_AURA_NEW            = 119,
    SPELL_EFFECT_TELEPORT_GRAVEYARD        = 120,
    SPELL_EFFECT_NORMALIZED_WEAPON_DMG     = 121,
    TOTAL_SPELL_EFFECTS                    = 122
};

enum CharacterStates
{
    STATE_SITTING                          = 1,
    STATE_SITTINGCHAIR                     = 2,
    STATE_SLEEPING                         = 3,
    STATE_SITTINGCHAIRLOW                  = 4,
    STATE_SITTINGCHAIRMEDIUM               = 5,
    STATE_SITTINGCHAIRHIGH                 = 6,
    STATE_DEAD                             = 7,
    STATE_KNEEL                            = 8
};

enum GameobjectTypes
{
    GAMEOBJECT_TYPE_DOOR                   = 0,
    GAMEOBJECT_TYPE_BUTTON                 = 1,
    GAMEOBJECT_TYPE_QUESTGIVER             = 2,
    GAMEOBJECT_TYPE_CHEST                  = 3,
    GAMEOBJECT_TYPE_BINDER                 = 4,
    GAMEOBJECT_TYPE_GENERIC                = 5,
    GAMEOBJECT_TYPE_TRAP                   = 6,
    GAMEOBJECT_TYPE_CHAIR                  = 7,
    GAMEOBJECT_TYPE_SPELL_FOCUS            = 8,
    GAMEOBJECT_TYPE_TEXT                   = 9,
    GAMEOBJECT_TYPE_GOOBER                 = 10,
    GAMEOBJECT_TYPE_TRANSPORT              = 11,
    GAMEOBJECT_TYPE_AREADAMAGE             = 12,
    GAMEOBJECT_TYPE_CAMERA                 = 13,
    GAMEOBJECT_TYPE_MAP_OBJECT             = 14,
    GAMEOBJECT_TYPE_MO_TRANSPORT           = 15,
    GAMEOBJECT_TYPE_DUEL_ARBITER           = 16,
    GAMEOBJECT_TYPE_FISHINGNODE            = 17,
    GAMEOBJECT_TYPE_SUMMONING_RITUAL       = 18,
    GAMEOBJECT_TYPE_MAILBOX                = 19,
    GAMEOBJECT_TYPE_AUCTIONHOUSE           = 20,
    GAMEOBJECT_TYPE_GUARDPOST              = 21,
    GAMEOBJECT_TYPE_SPELLCASTER            = 22,
    GAMEOBJECT_TYPE_MEETINGSTONE           = 23,
    GAMEOBJECT_TYPE_FLAGSTAND              = 24,
    GAMEOBJECT_TYPE_FISHINGHOLE            = 25,
    GAMEOBJECT_TYPE_FLAGDROP               = 26,
    // Custom gametypes, can create problems at sending to client,
    GAMEOBJECT_TYPE_CUSTOM_TELEPORTER      = 27
};

enum TextEmote
{
    TEXTEMOTE_AGREE                = 1,
    TEXTEMOTE_AMAZE                = 2,
    TEXTEMOTE_ANGRY                = 3,
    TEXTEMOTE_APOLOGIZE            = 4,
    TEXTEMOTE_APPLAUD              = 5,
    TEXTEMOTE_BASHFUL              = 6,
    TEXTEMOTE_BECKON               = 7,
    TEXTEMOTE_BEG                  = 8,
    TEXTEMOTE_BITE                 = 9,
    TEXTEMOTE_BLEED                = 10,
    TEXTEMOTE_BLINK                = 11,
    TEXTEMOTE_BLUSH                = 12,
    TEXTEMOTE_BONK                 = 13,
    TEXTEMOTE_BORED                = 14,
    TEXTEMOTE_BOUNCE               = 15,
    TEXTEMOTE_BRB                  = 16,
    TEXTEMOTE_BOW                  = 17,
    TEXTEMOTE_BURP                 = 18,
    TEXTEMOTE_BYE                  = 19,
    TEXTEMOTE_CACKLE               = 20,
    TEXTEMOTE_CHEER                = 21,
    TEXTEMOTE_CHICKEN              = 22,
    TEXTEMOTE_CHUCKLE              = 23,
    TEXTEMOTE_CLAP                 = 24,
    TEXTEMOTE_CONFUSED             = 25,
    TEXTEMOTE_CONGRATULATE         = 26,
    TEXTEMOTE_COUGH                = 27,
    TEXTEMOTE_COWER                = 28,
    TEXTEMOTE_CRACK                = 29,
    TEXTEMOTE_CRINGE               = 30,
    TEXTEMOTE_CRY                  = 31,
    TEXTEMOTE_CURIOUS              = 32,
    TEXTEMOTE_CURTSEY              = 33,
    TEXTEMOTE_DANCE                = 34,
    TEXTEMOTE_DRINK                = 35,
    TEXTEMOTE_DROOL                = 36,
    TEXTEMOTE_EAT                  = 37,
    TEXTEMOTE_EYE                  = 38,
    TEXTEMOTE_FART                 = 39,
    TEXTEMOTE_FIDGET               = 40,
    TEXTEMOTE_FLEX                 = 41,
    TEXTEMOTE_FROWN                = 42,
    TEXTEMOTE_GASP                 = 43,
    TEXTEMOTE_GAZE                 = 44,
    TEXTEMOTE_GIGGLE               = 45,
    TEXTEMOTE_GLARE                = 46,
    TEXTEMOTE_GLOAT                = 47,
    TEXTEMOTE_GREET                = 48,
    TEXTEMOTE_GRIN                 = 49,
    TEXTEMOTE_GROAN                = 50,
    TEXTEMOTE_GROVEL               = 51,
    TEXTEMOTE_GUFFAW               = 52,
    TEXTEMOTE_HAIL                 = 53,
    TEXTEMOTE_HAPPY                = 54,
    TEXTEMOTE_HELLO                = 55,
    TEXTEMOTE_HUG                  = 56,
    TEXTEMOTE_HUNGRY               = 57,
    TEXTEMOTE_KISS                 = 58,
    TEXTEMOTE_KNEEL                = 59,
    TEXTEMOTE_LAUGH                = 60,
    TEXTEMOTE_LAYDOWN              = 61,
    TEXTEMOTE_MESSAGE              = 62,
    TEXTEMOTE_MOAN                 = 63,
    TEXTEMOTE_MOON                 = 64,
    TEXTEMOTE_MOURN                = 65,
    TEXTEMOTE_NO                   = 66,
    TEXTEMOTE_NOD                  = 67,
    TEXTEMOTE_NOSEPICK             = 68,
    TEXTEMOTE_PANIC                = 69,
    TEXTEMOTE_PEER                 = 70,
    TEXTEMOTE_PLEAD                = 71,
    TEXTEMOTE_POINT                = 72,
    TEXTEMOTE_POKE                 = 73,
    TEXTEMOTE_PRAY                 = 74,
    TEXTEMOTE_ROAR                 = 75,
    TEXTEMOTE_ROFL                 = 76,
    TEXTEMOTE_RUDE                 = 77,
    TEXTEMOTE_SALUTE               = 78,
    TEXTEMOTE_SCRATCH              = 79,
    TEXTEMOTE_SEXY                 = 80,
    TEXTEMOTE_SHAKE                = 81,
    TEXTEMOTE_SHOUT                = 82,
    TEXTEMOTE_SHRUG                = 83,
    TEXTEMOTE_SHY                  = 84,
    TEXTEMOTE_SIGH                 = 85,
    TEXTEMOTE_SIT                  = 86,
    TEXTEMOTE_SLEEP                = 87,
    TEXTEMOTE_SNARL                = 88,
    TEXTEMOTE_SPIT                 = 89,
    TEXTEMOTE_STARE                = 90,
    TEXTEMOTE_SURPRISED            = 91,
    TEXTEMOTE_SURRENDER            = 92,
    TEXTEMOTE_TALK                 = 93,
    TEXTEMOTE_TALKEX               = 94,
    TEXTEMOTE_TALKQ                = 95,
    TEXTEMOTE_TAP                  = 96,
    TEXTEMOTE_THANK                = 97,
    TEXTEMOTE_THREATEN             = 98,
    TEXTEMOTE_TIRED                = 99,
    TEXTEMOTE_VICTORY              = 100,
    TEXTEMOTE_WAVE                 = 101,
    TEXTEMOTE_WELCOME              = 102,
    TEXTEMOTE_WHINE                = 103,
    TEXTEMOTE_WHISTLE              = 104,
    TEXTEMOTE_WORK                 = 105,
    TEXTEMOTE_YAWN                 = 106,
    TEXTEMOTE_BOGGLE               = 107,
    TEXTEMOTE_CALM                 = 108,
    TEXTEMOTE_COLD                 = 109,
    TEXTEMOTE_COMFORT              = 110,
    TEXTEMOTE_CUDDLE               = 111,
    TEXTEMOTE_DUCK                 = 112,
    TEXTEMOTE_INSULT               = 113,
    TEXTEMOTE_INTRODUCE            = 114,
    TEXTEMOTE_JK                   = 115,
    TEXTEMOTE_LICK                 = 116,
    TEXTEMOTE_LISTEN               = 117,
    TEXTEMOTE_LOST                 = 118,
    TEXTEMOTE_MOCK                 = 119,
    TEXTEMOTE_PONDER               = 120,
    TEXTEMOTE_POUNCE               = 121,
    TEXTEMOTE_PRAISE               = 122,
    TEXTEMOTE_PURR                 = 123,
    TEXTEMOTE_PUZZLE               = 124,
    TEXTEMOTE_RAISE                = 125,
    TEXTEMOTE_READY                = 126,
    TEXTEMOTE_SHIMMY               = 127,
    TEXTEMOTE_SHIVER               = 128,
    TEXTEMOTE_SHOO                 = 129,
    TEXTEMOTE_SLAP                 = 130,
    TEXTEMOTE_SMIRK                = 131,
    TEXTEMOTE_SNIFF                = 132,
    TEXTEMOTE_SNUB                 = 133,
    TEXTEMOTE_SOOTHE               = 134,
    TEXTEMOTE_STINK                = 135,
    TEXTEMOTE_TAUNT                = 136,
    TEXTEMOTE_TEASE                = 137,
    TEXTEMOTE_THIRSTY              = 138,
    TEXTEMOTE_VETO                 = 139,
    TEXTEMOTE_SNICKER              = 140,
    TEXTEMOTE_STAND                = 141,
    TEXTEMOTE_TICKLE               = 142,
    TEXTEMOTE_VIOLIN               = 143,
    TEXTEMOTE_SMILE                = 163,
    TEXTEMOTE_RASP                 = 183,
    TEXTEMOTE_PITY                 = 203,
    TEXTEMOTE_GROWL                = 204,
    TEXTEMOTE_BARK                 = 205,
    TEXTEMOTE_SCARED               = 223,
    TEXTEMOTE_FLOP                 = 224,
    TEXTEMOTE_LOVE                 = 225,
    TEXTEMOTE_MOO                  = 226,
    TEXTEMOTE_COMMEND              = 243,
    TEXTEMOTE_JOKE                 = 329
};

enum Emote
{
    EMOTE_ONESHOT_NONE                 = 0,
    EMOTE_ONESHOT_TALK                 = 1,
    EMOTE_ONESHOT_BOW                  = 2,
    EMOTE_ONESHOT_WAVE                 = 3,
    EMOTE_ONESHOT_CHEER                = 4,
    EMOTE_ONESHOT_EXCLAMATION          = 5,
    EMOTE_ONESHOT_QUESTION             = 6,
    EMOTE_ONESHOT_EAT                  = 7,
    EMOTE_STATE_DANCE                  = 10,
    EMOTE_ONESHOT_LAUGH                = 11,
    EMOTE_STATE_SLEEP                  = 12,
    EMOTE_STATE_SIT                    = 13,
    EMOTE_ONESHOT_RUDE                 = 14,
    EMOTE_ONESHOT_ROAR                 = 15,
    EMOTE_ONESHOT_KNEEL                = 16,
    EMOTE_ONESHOT_KISS                 = 17,
    EMOTE_ONESHOT_CRY                  = 18,
    EMOTE_ONESHOT_CHICKEN              = 19,
    EMOTE_ONESHOT_BEG                  = 20,
    EMOTE_ONESHOT_APPLAUD              = 21,
    EMOTE_ONESHOT_SHOUT                = 22,
    EMOTE_ONESHOT_FLEX                 = 23,
    EMOTE_ONESHOT_SHY                  = 24,
    EMOTE_ONESHOT_POINT                = 25,
    EMOTE_STATE_STAND                  = 26,
    EMOTE_STATE_READYUNARMED           = 27,
    EMOTE_STATE_WORK                   = 28,
    EMOTE_STATE_POINT                  = 29,
    EMOTE_STATE_NONE                   = 30,
    EMOTE_ONESHOT_WOUND                = 33,
    EMOTE_ONESHOT_WOUNDCRITICAL        = 34,
    EMOTE_ONESHOT_ATTACKUNARMED        = 35,
    EMOTE_ONESHOT_ATTACK1H             = 36,
    EMOTE_ONESHOT_ATTACK2HTIGHT        = 37,
    EMOTE_ONESHOT_ATTACK2HLOOSE        = 38,
    EMOTE_ONESHOT_PARRYUNARMED         = 39,
    EMOTE_ONESHOT_PARRYSHIELD          = 43,
    EMOTE_ONESHOT_READYUNARMED         = 44,
    EMOTE_ONESHOT_READY1H              = 45,
    EMOTE_ONESHOT_READYBOW             = 48,
    EMOTE_ONESHOT_SPELLPRECAST         = 50,
    EMOTE_ONESHOT_SPELLCAST            = 51,
    EMOTE_ONESHOT_BATTLEROAR           = 53,
    EMOTE_ONESHOT_SPECIALATTACK1H      = 54,
    EMOTE_ONESHOT_KICK                 = 60,
    EMOTE_ONESHOT_ATTACKTHROWN         = 61,
    EMOTE_STATE_STUN                   = 64,
    EMOTE_STATE_DEAD                   = 65,
    EMOTE_ONESHOT_SALUTE               = 66,
    EMOTE_STATE_KNEEL                  = 68,
    EMOTE_STATE_USESTANDING            = 69,
    EMOTE_ONESHOT_WAVE_NOSHEATHE       = 70,
    EMOTE_ONESHOT_CHEER_NOSHEATHE      = 71,
    EMOTE_ONESHOT_EAT_NOSHEATHE        = 92,
    EMOTE_STATE_STUN_NOSHEATHE         = 93,
    EMOTE_ONESHOT_DANCE                = 94,
    EMOTE_ONESHOT_SALUTE_NOSHEATH      = 113,
    EMOTE_STATE_USESTANDING_NOSHEATHE  = 133,
    EMOTE_ONESHOT_LAUGH_NOSHEATHE      = 153,
    EMOTE_STATE_WORK_NOSHEATHE         = 173,
    EMOTE_STATE_SPELLPRECAST           = 193,
    EMOTE_ONESHOT_READYRIFLE           = 213,
    EMOTE_STATE_READYRIFLE             = 214,
    EMOTE_STATE_WORK_NOSHEATHE_MINING  = 233,
    EMOTE_STATE_WORK_NOSHEATHE_CHOPWOOD= 234,
    EMOTE_zzOLDONESHOT_LIFTOFF         = 253,
    EMOTE_ONESHOT_LIFTOFF              = 254,
    EMOTE_ONESHOT_YES                  = 273,
    EMOTE_ONESHOT_NO                   = 274,
    EMOTE_ONESHOT_TRAIN                = 275,
    EMOTE_ONESHOT_LAND                 = 293,
    EMOTE_STATE_READY1H                = 333,
    EMOTE_STATE_AT_EASE                = 313,
    EMOTE_STATE_SPELLKNEELSTART        = 353,
    EMOTE_STATE_SUBMERGED              = 373,
    EMOTE_ONESHOT_SUBMERGE             = 374
};

enum Anim
{
    ANIM_STAND                     = 0x0,
    ANIM_DEATH                     = 0x1,
    ANIM_SPELL                     = 0x2,
    ANIM_STOP                      = 0x3,
    ANIM_WALK                      = 0x4,
    ANIM_RUN                       = 0x5,
    ANIM_DEAD                      = 0x6,
    ANIM_RISE                      = 0x7,
    ANIM_STANDWOUND                = 0x8,
    ANIM_COMBATWOUND               = 0x9,
    ANIM_COMBATCRITICAL            = 0xA,
    ANIM_SHUFFLE_LEFT              = 0xB,
    ANIM_SHUFFLE_RIGHT             = 0xC,
    ANIM_WALK_BACKWARDS            = 0xD,
    ANIM_STUN                      = 0xE,
    ANIM_HANDS_CLOSED              = 0xF,
    ANIM_ATTACKUNARMED             = 0x10,
    ANIM_ATTACK1H                  = 0x11,
    ANIM_ATTACK2HTIGHT             = 0x12,
    ANIM_ATTACK2HLOOSE             = 0x13,
    ANIM_PARRYUNARMED              = 0x14,
    ANIM_PARRY1H                   = 0x15,
    ANIM_PARRY2HTIGHT              = 0x16,
    ANIM_PARRY2HLOOSE              = 0x17,
    ANIM_PARRYSHIELD               = 0x18,
    ANIM_READYUNARMED              = 0x19,
    ANIM_READY1H                   = 0x1A,
    ANIM_READY2HTIGHT              = 0x1B,
    ANIM_READY2HLOOSE              = 0x1C,
    ANIM_READYBOW                  = 0x1D,
    ANIM_DODGE                     = 0x1E,
    ANIM_SPELLPRECAST              = 0x1F,
    ANIM_SPELLCAST                 = 0x20,
    ANIM_SPELLCASTAREA             = 0x21,
    ANIM_NPCWELCOME                = 0x22,
    ANIM_NPCGOODBYE                = 0x23,
    ANIM_BLOCK                     = 0x24,
    ANIM_JUMPSTART                 = 0x25,
    ANIM_JUMP                      = 0x26,
    ANIM_JUMPEND                   = 0x27,
    ANIM_FALL                      = 0x28,
    ANIM_SWIMIDLE                  = 0x29,
    ANIM_SWIM                      = 0x2A,
    ANIM_SWIM_LEFT                 = 0x2B,
    ANIM_SWIM_RIGHT                = 0x2C,
    ANIM_SWIM_BACKWARDS            = 0x2D,
    ANIM_ATTACKBOW                 = 0x2E,
    ANIM_FIREBOW                   = 0x2F,
    ANIM_READYRIFLE                = 0x30,
    ANIM_ATTACKRIFLE               = 0x31,
    ANIM_LOOT                      = 0x32,
    ANIM_SPELL_PRECAST_DIRECTED    = 0x33,
    ANIM_SPELL_PRECAST_OMNI        = 0x34,
    ANIM_SPELL_CAST_DIRECTED       = 0x35,
    ANIM_SPELL_CAST_OMNI           = 0x36,
    ANIM_SPELL_BATTLEROAR          = 0x37,
    ANIM_SPELL_READYABILITY        = 0x38,
    ANIM_SPELL_SPECIAL1H           = 0x39,
    ANIM_SPELL_SPECIAL2H           = 0x3A,
    ANIM_SPELL_SHIELDBASH          = 0x3B,
    ANIM_EMOTE_TALK                = 0x3C,
    ANIM_EMOTE_EAT                 = 0x3D,
    ANIM_EMOTE_WORK                = 0x3E,
    ANIM_EMOTE_USE_STANDING        = 0x3F,
    ANIM_EMOTE_EXCLAMATION         = 0x40,
    ANIM_EMOTE_QUESTION            = 0x41,
    ANIM_EMOTE_BOW                 = 0x42,
    ANIM_EMOTE_WAVE                = 0x43,
    ANIM_EMOTE_CHEER               = 0x44,
    ANIM_EMOTE_DANCE               = 0x45,
    ANIM_EMOTE_LAUGH               = 0x46,
    ANIM_EMOTE_SLEEP               = 0x47,
    ANIM_EMOTE_SIT_GROUND          = 0x48,
    ANIM_EMOTE_RUDE                = 0x49,
    ANIM_EMOTE_ROAR                = 0x4A,
    ANIM_EMOTE_KNEEL               = 0x4B,
    ANIM_EMOTE_KISS                = 0x4C,
    ANIM_EMOTE_CRY                 = 0x4D,
    ANIM_EMOTE_CHICKEN             = 0x4E,
    ANIM_EMOTE_BEG                 = 0x4F,
    ANIM_EMOTE_APPLAUD             = 0x50,
    ANIM_EMOTE_SHOUT               = 0x51,
    ANIM_EMOTE_FLEX                = 0x52,
    ANIM_EMOTE_SHY                 = 0x53,
    ANIM_EMOTE_POINT               = 0x54,
    ANIM_ATTACK1HPIERCE            = 0x55,
    ANIM_ATTACK2HLOOSEPIERCE       = 0x56,
    ANIM_ATTACKOFF                 = 0x57,
    ANIM_ATTACKOFFPIERCE           = 0x58,
    ANIM_SHEATHE                   = 0x59,
    ANIM_HIPSHEATHE                = 0x5A,
    ANIM_MOUNT                     = 0x5B,
    ANIM_RUN_LEANRIGHT             = 0x5C,
    ANIM_RUN_LEANLEFT              = 0x5D,
    ANIM_MOUNT_SPECIAL             = 0x5E,
    ANIM_KICK                      = 0x5F,
    ANIM_SITDOWN                   = 0x60,
    ANIM_SITTING                   = 0x61,
    ANIM_SITUP                     = 0x62,
    ANIM_SLEEPDOWN                 = 0x63,
    ANIM_SLEEPING                  = 0x64,
    ANIM_SLEEPUP                   = 0x65,
    ANIM_SITCHAIRLOW               = 0x66,
    ANIM_SITCHAIRMEDIUM            = 0x67,
    ANIM_SITCHAIRHIGH              = 0x68,
    ANIM_LOADBOW                   = 0x69,
    ANIM_LOADRIFLE                 = 0x6A,
    ANIM_ATTACKTHROWN              = 0x6B,
    ANIM_READYTHROWN               = 0x6C,
    ANIM_HOLDBOW                   = 0x6D,
    ANIM_HOLDRIFLE                 = 0x6E,
    ANIM_HOLDTHROWN                = 0x6F,
    ANIM_LOADTHROWN                = 0x70,
    ANIM_EMOTE_SALUTE              = 0x71,
    ANIM_KNEELDOWN                 = 0x72,
    ANIM_KNEELING                  = 0x73,
    ANIM_KNEELUP                   = 0x74,
    ANIM_ATTACKUNARMEDOFF          = 0x75,
    ANIM_SPECIALUNARMED            = 0x76,
    ANIM_STEALTHWALK               = 0x77,
    ANIM_STEALTHSTAND              = 0x78,
    ANIM_KNOCKDOWN                 = 0x79,
    ANIM_EATING                    = 0x7A,
    ANIM_USESTANDINGLOOP           = 0x7B,
    ANIM_CHANNELCASTDIRECTED       = 0x7C,
    ANIM_CHANNELCASTOMNI           = 0x7D,
    ANIM_WHIRLWIND                 = 0x7E,
    ANIM_BIRTH                     = 0x7F,
    ANIM_USESTANDINGSTART          = 0x80,
    ANIM_USESTANDINGEND            = 0x81,
    ANIM_HOWL                      = 0x82,
    ANIM_DROWN                     = 0x83,
    ANIM_DROWNED                   = 0x84,
    ANIM_FISHINGCAST               = 0x85,
    ANIM_FISHINGLOOP               = 0x86,
    ANIM_FLY                       = 0x87,
    ANIM_EMOTE_WORK_NO_SHEATHE     = 0x88,
    ANIM_EMOTE_STUN_NO_SHEATHE     = 0x89,
    ANIM_EMOTE_USE_STANDING_NO_SHEATHE= 0x8A,
    ANIM_SPELL_SLEEP_DOWN          = 0x8B,
    ANIM_SPELL_KNEEL_START         = 0x8C,
    ANIM_SPELL_KNEEL_LOOP          = 0x8D,
    ANIM_SPELL_KNEEL_END           = 0x8E,
    ANIM_SPRINT                    = 0x8F,
    ANIM_IN_FIGHT                  = 0x90,

    FIRST_GAMEOBJECTANIMATION      = 0x91,
    ANIM_GAMEOBJ_SPAWN             = 0,
    ANIM_GAMEOBJ_CLOSED            = 1,
    ANIM_GAMEOBJ_OPEN              = 2,
    ANIM_GAMEOBJ_OPENED            = 3,
    ANIM_GAMEOBJ_CLOSE             = 4,
    ANIM_GAMEOBJ_DESTROY           = 5,
    ANIM_GAMEOBJ_DESTROYED         = 6,
    ANIM_GAMEOBJ_REBUILD           = 7,
    ANIM_GAMEOBJ_CUSTOM0           = 8,
    ANIM_GAMEOBJ_CUSTOM1           = 9,
    ANIM_GAMEOBJ_CUSTOM2           = 10,
    ANIM_GAMEOBJ_CUSTOM3           = 11,

    FIRST_EFFECTANIMATION          = 0x93,
    ANIM_EFFECT_STAND              = 0,
    ANIM_EFFECT_HOLD               = 1,
    ANIM_EFFECT_DECAY              = 2,

    FIRST_ITEMANIMATION            = 0x96,
    ANIM_ITEM_STAND                = 0,
    ANIM_ITEM_INFLIGHT             = 1,
    ANIM_ITEM_BOWPULL              = 2,
    ANIM_ITEM_BOWRELEASE           = 3
};

enum LockType
{
    LOCKTYPE_PICKLOCK              = 1,
    LOCKTYPE_HERBALISM             = 2,
    LOCKTYPE_MINING                = 3,
    LOCKTYPE_DISARM_TRAP           = 4,
    LOCKTYPE_OPEN                  = 5,
    LOCKTYPE_TREASURE              = 6,
    LOCKTYPE_CALCIFIED_ELVEN_GEMS  = 7,
    LOCKTYPE_CLOSE                 = 8,
    LOCKTYPE_ARM_TRAP              = 9,
    LOCKTYPE_QUICK_OPEN            = 10,
    LOCKTYPE_QUICK_CLOSE           = 11,
    LOCKTYPE_OPEN_TINKERING        = 12,
    LOCKTYPE_OPEN_KNEELING         = 13,
    LOCKTYPE_OPEN_ATTACKING        = 14,
    LOCKTYPE_GAHZRIDIAN            = 15,
    LOCKTYPE_BLASTING              = 16,
    LOCKTYPE_SLOW_OPEN             = 17,
    LOCKTYPE_SLOW_CLOSE            = 18
};

enum TrainerType                                            // this is important type for npcs!
{
    TRAINER_TYPE_CLASS             = 0,
    TRAINER_TYPE_MOUNTS            = 1,
    TRAINER_TYPE_TRADESKILLS       = 2,
    TRAINER_TYPE_PETS              = 3
};

enum CreatureType
{
    CREATURE_TYPE_BEAST            = 1,
    CREATURE_TYPE_DRAGON           = 2,
    CREATURE_TYPE_DEMON            = 3,
    CREATURE_TYPE_ELEMENTAL        = 4,
    CREATURE_TYPE_GIANT            = 5,
    CREATURE_TYPE_UNDEAD           = 6,
    CREATURE_TYPE_HUMANOID         = 7,
    CREATURE_TYPE_CRITTER          = 8,
    CREATURE_TYPE_MECHANICAL       = 9,
    CREATURE_TYPE_UNKNOWN          = 10
};

enum CreatureFamily
{
    CREATURE_FAMILY_WOLF           = 1,
    CREATURE_FAMILY_CAT            = 2,
    CREATURE_FAMILY_SPIDER         = 3,
    CREATURE_FAMILY_BEAR           = 4,
    CREATURE_FAMILY_BOAR           = 5,
    CREATURE_FAMILY_CROCILISK      = 6,
    CREATURE_FAMILY_CARRION_BIRD   = 7,
    CREATURE_FAMILY_CRAB           = 8,
    CREATURE_FAMILY_GORILLA        = 9,
    CREATURE_FAMILY_RAPTOR         = 11,
    CREATURE_FAMILY_TALLSTRIDER    = 12,
    CREATURE_FAMILY_FELHUNTER      = 15,
    CREATURE_FAMILY_VOIDWALKER     = 16,
    CREATURE_FAMILY_SUCCUBUS       = 17,
    CREATURE_FAMILY_DOOMGUARD      = 19,
    CREATURE_FAMILY_SCORPID        = 20,
    CREATURE_FAMILY_TURTLE         = 21,
    CREATURE_FAMILY_IMP            = 23,
    CREATURE_FAMILY_BAT            = 24,
    CREATURE_FAMILY_HYENA          = 25,
    CREATURE_FAMILY_OWL            = 26,
    CREATURE_FAMILY_WIND_SERPENT   = 27
};

enum CreatureEliteType
{
    CREATURE_ELITE_NORMAL          = 0,
    CREATURE_ELITE_ELITE           = 1,
    CREATURE_ELITE_RAREELITE       = 2,
    CREATURE_ELITE_WORLDBOSS       = 3,
    CREATURE_ELITE_RARE            = 4
};

enum QuestTypes
{
    QUEST_TYPE_ELITE               = 1,
    QUEST_TYPE_LIFE                = 21,
    QUEST_TYPE_PVP                 = 41,
    QUEST_TYPE_RAID                = 62,
    QUEST_TYPE_DUNGEON             = 81
};

enum QuestSort
{
    QUEST_SORT_EPIC                = 1,
    QUEST_SORT_WAILING_CAVERNS_OLD = 21,
    QUEST_SORT_SEASONAL            = 22,
    QUEST_SORT_UNDERCITY_OLD       = 23,
    QUEST_SORT_HERBALISM           = 24,
    QUEST_SORT_SCARLET_MONASTERY_OLD= 25,
    QUEST_SORT_ULDAMN_OLD          = 41,
    QUEST_SORT_WARLOCK             = 61,
    QUEST_SORT_WARRIOR             = 81,
    QUEST_SORT_SHAMAN              = 82,
    QUEST_SORT_FISHING             = 101,
    QUEST_SORT_BLACKSMITHING       = 121,
    QUEST_SORT_PALADIN             = 141,
    QUEST_SORT_MAGE                = 161,
    QUEST_SORT_ROGUE               = 162,
    QUEST_SORT_ALCHEMY             = 181,
    QUEST_SORT_LEATHERWORKING      = 182,
    QUEST_SORT_ENGINERING          = 201,
    QUEST_SORT_TREASURE_MAP        = 221,
    QUEST_SORT_SUNKEN_TEMPLE_OLD   = 241,
    QUEST_SORT_HUNTER              = 261,
    QUEST_SORT_PRIEST              = 262,
    QUEST_SORT_DRUID               = 263,
    QUEST_SORT_TAILORING           = 264,
    QUEST_SORT_SPECIAL             = 284,
    QUEST_SORT_COOKING             = 304,
    QUEST_SORT_FIRST_AID           = 324
};

enum SkillType
{
    SKILL_FROST                    = 6,
    SKILL_FIRE                     = 8,
    SKILL_ARMS                     = 26,
    SKILL_COMBAT                   = 38,
    SKILL_SUBTLETY                 = 39,
    SKILL_POISONS                  = 40,
    SKILL_SWORDS                   = 43,
    SKILL_AXES                     = 44,
    SKILL_BOWS                     = 45,
    SKILL_GUNS                     = 46,
    SKILL_BEAST_MASTERY            = 50,
    SKILL_SURVIVAL                 = 51,
    SKILL_MACES                    = 54,
    SKILL_HOLY                     = 56,
    SKILL_2H_SWORDS                = 55,
    SKILL_SHADOW                   = 78,
    SKILL_DEFENSE                  = 95,
    SKILL_LANG_COMMON              = 98,
    SKILL_RACIAL_DWARVEN           = 101,
    SKILL_LANG_ORCISH              = 109,
    SKILL_LANG_DWARVEN             = 111,
    SKILL_LANG_DARNASSIAN          = 113,
    SKILL_LANG_TAURAHE             = 115,
    SKILL_DUAL_WIELD               = 118,
    SKILL_RACIAL_TAUREN            = 124,
    SKILL_ORC_RACIAL               = 125,
    SKILL_RACIAL_NIGHT_ELF         = 126,
    SKILL_FIRST_AID                = 129,
    SKILL_FERAL_COMBAT             = 134,
    SKILL_STAVES                   = 136,
    SKILL_LANG_THALASSIAN          = 137,
    SKILL_LANG_DRACONIC            = 138,
    SKILL_LANG_DEMON_TONGUE        = 139,
    SKILL_LANG_TITAN               = 140,
    SKILL_LANG_OLD_TONGUE          = 141,
    SKILL_SURVIVAL2                = 142,
    SKILL_RIDING_HORSE             = 148,
    SKILL_RIDING_WOLF              = 149,
    SKILL_RIDING_RAM               = 152,
    SKILL_RIDING_TIGER             = 150,
    SKILL_SWIMING                  = 155,
    SKILL_2H_MACES                 = 160,
    SKILL_UNARMED                  = 162,
    SKILL_MARKSMANSHIP             = 163,
    SKILL_BLACKSMITHING            = 164,
    SKILL_LEATHERWORKING           = 165,
    SKILL_ALCHEMY                  = 171,
    SKILL_2H_AXES                  = 172,
    SKILL_DAGGERS                  = 173,
    SKILL_THROWN                   = 176,
    SKILL_HERBALISM                = 182,
    SKILL_GENERIC_DND              = 183,
    SKILL_RETRIBUTION              = 184,
    SKILL_COOKING                  = 185,
    SKILL_MINING                   = 186,
    SKILL_PET_IMP                  = 188,
    SKILL_PET_FELHUNTER            = 189,
    SKILL_TAILORING                = 197,
    SKILL_ENGINERING               = 202,
    SKILL_PET_SPIDER               = 203,
    SKILL_PET_VOIDWALKER           = 204,
    SKILL_PET_SUCCUBUS             = 205,
    SKILL_PET_INFERNAL             = 206,
    SKILL_PET_DOOMGUARD            = 207,
    SKILL_PET_WOLF                 = 208,
    SKILL_PET_CAT                  = 209,
    SKILL_PET_BEAR                 = 210,
    SKILL_PET_BOAR                 = 211,
    SKILL_PET_CROCILISK            = 212,
    SKILL_PET_CARRION_BIRD         = 213,
    SKILL_PET_GORILLA              = 215,
    SKILL_PET_CRAB                 = 214,
    SKILL_PET_RAPTOR               = 217,
    SKILL_PET_TALLSTRIDER          = 218,
    SKILL_RACIAL_UNDED             = 220,
    SKILL_WEAPON_TALENTS           = 222,
    SKILL_CROSSBOWS                = 226,
    SKILL_SPEARS                   = 227,
    SKILL_WANDS                    = 228,
    SKILL_POLEARMS                 = 229,
    SKILL_ATTRIBUTE_ENCHANCEMENTS  = 230,
    SKILL_SLAYER_TALENTS           = 231,
    SKILL_MAGIC_TALENTS            = 233,
    SKILL_DEFENSIVE_TALENTS        = 234,
    SKILL_PET_SCORPID              = 236,
    SKILL_ARCANE                   = 237,
    SKILL_OPEN_LOCK                = 242,
    SKILL_PET_TURTLE               = 251,
    SKILL_FURY                     = 256,
    SKILL_PROTECTION               = 257,
    SKILL_BEAST_TRAINING           = 261,
    SKILL_PROTECTION2              = 267,
    SKILL_PET_TALENTS              = 270,
    SKILL_PLATE_MAIL               = 293,
    SKILL_ASSASSINATION            = 253,
    SKILL_LANG_GNOMISH             = 313,
    SKILL_LANG_TROLL               = 315,
    SKILL_ENCHANTING               = 333,
    SKILL_DEMONOLOGY               = 354,
    SKILL_AFFLICTION               = 355,
    SKILL_FISHING                  = 356,
    SKILL_ENHANCEMENT              = 373,
    SKILL_RESTORATION              = 374,
    SKILL_ELEMENTAL_COMBAT         = 375,
    SKILL_SKINNING                 = 393,
    SKILL_LEATHER                  = 414,
    SKILL_CLOTH                    = 415,
    SKILL_MAIL                     = 413,
    SKILL_SHIELD                   = 433,
    SKILL_FIST_WEAPONS             = 473,
    SKILL_TRACKING_BEAST           = 513,
    SKILL_TRACKING_HUMANOID        = 514,
    SKILL_TRACKING_DEMON           = 516,
    SKILL_TRACKING_UNDEAD          = 517,
    SKILL_TRACKING_DRAGON          = 518,
    SKILL_TRACKING_ELEMENTAL       = 519,
    SKILL_RIDING_RAPTOR            = 533,
    SKILL_RIDING_MECHANOSTRIDER    = 553,
    SKILL_RIDING_UNDEAD_HORSE      = 554,
    SKILL_RESTORATION2             = 573,
    SKILL_BALANCE                  = 574,
    SKILL_DESTRUCTION              = 593,
    SKILL_HOLY2                    = 594,
    SKILL_DISCIPLINE               = 613,
    SKILL_LOCKPICKING              = 633,
    SKILL_PET_BAT                  = 653,
    SKILL_PET_HYENA                = 654,
    SKILL_PET_OWL                  = 655,
    SKILL_PET_WIND_SERPENT         = 656,
    SKILL_LANG_GUTTERSPEAK         = 673,
    SKILL_RIDING_KODO              = 713,
    SKILL_RACIAL_TROLL             = 733,
    SKILL_RACIAL_GNOME             = 753,
    SKILL_RACIAL_HUMAN             = 754,
    SKILL_RIDING                   = 762
};

#define UNIT_DYNFLAG_LOOTABLE           0x0001

#define UNIT_DYNFLAG_TRACK_UNIT         0x0002

#define UNIT_DYNFLAG_OTHER_TAGGER       0x0004

#define UNIT_DYNFLAG_ROOTED             0x0008

#define UNIT_DYNFLAG_SPECIALINFO        0x0010

#define UNIT_DYNFLAG_DEAD               0x0020

#define UNIT_FLAG_NOT_ATTACKABLE        0x0002

#define UNIT_FLAG_ATTACKABLE            0x0008

#define UNIT_FLAG_NOT_ATTACKABLE_1      0x0080

#define UNIT_FLAG_NON_PVP_PLAYER        (UNIT_FLAG_ATTACKABLE + UNIT_FLAG_NOT_ATTACKABLE_1)

#define UNIT_FLAG_ANIMATION_FROZEN      0x0400
#define UNIT_FLAG_WAR_PLAYER            0x1000

#define SPELL_ID_AGGRO                    22764

enum WeatherTypes
{
    WEATHER_TYPE_FINE = 0,
    WEATHER_TYPE_RAIN = 1,
    WEATHER_TYPE_SNOW = 2,
    WEATHER_TYPE_STORM= 3
};

#define MAX_WEATHER_TYPE 4

#endif
