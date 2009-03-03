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

#ifndef _ITEMPROTOTYPE_H
#define _ITEMPROTOTYPE_H

#include "Common.h"

#define    ITEM_STAT_ARMOR_MOD                   0.10
#define    ITEM_STAT_DBU_ATTACK_POWER_MOD        0.33
#define    ITEM_STAT_RANGED_ATTACK_POWER_MOD     0.40
#define    ITEM_STAT_HEALING_MOD                 0.45
#define    ITEM_STAT_ATTACK_POWER_MOD            0.50
#define    ITEM_STAT_DBU_SPELL_DAMAGE_MOD        0.55
#define    ITEM_STAT_BLOCK_MOD                   0.65
#define    ITEM_STAT_SCHOOL_SPELL_DAMAGE_MOD     0.70
#define    ITEM_STAT_ALL_SPELL_DAMAGE_MOD        0.85
#define    ITEM_STAT_MAGIC_PENETRATION_MOD       0.90
#define    ITEM_STAT_SCHOOL_RESIST_MOD           1.00
#define    ITEM_STAT_ALL_SPELL_RESIST_MOD        2.50
#define    ITEM_STAT_ATTRIBUTE_MOD               1.00
#define    ITEM_STAT_DEFENSE_MOD                 1.50
#define    ITEM_STAT_REGEN_IN_5_SEC_MOD          2.40
#define    ITEM_STAT_OTHER_WEAPON_SKILL_MOD      2.30
#define    ITEM_STAT_DAGGER_WEAPON_SKILL_MOD     3.00
#define    ITEM_STAT_DAMAGE_SHIELD_MOD           3.15
#define    ITEM_STAT_BLOCK_PCT_MOD               4.33
#define    ITEM_STAT_HIT_PCT_MOD                10.00
#define    ITEM_STAT_SPELL_HIT_PCT_MOD           8.00
#define    ITEM_STAT_DODGE_PCT_MOD              12.00
#define    ITEM_STAT_SPELL_CRIT_PCT_MOD         14.00
#define    ITEM_STAT_CRIT_PCT_MOD               14.00
#define    ITEM_STAT_PARRY_PCT_MOD              20.00

#define    ITEM_STAT_SCHOOL_RESIST_RING_MOD     0.72
#define    ITEM_STAT_ALL_SPELL_RESIST_RING_MOD  1.80
#define    ITEM_STAT_HP_REGEN_IN_5_SEC_RING_MOD 3.50
#define    ITEM_STAT_HP_REGEN_IN_5_SEC_NECK_MOD 3.50
#define    ITEM_STAT_BLOCK_SHIELD_MOD           0.60
#define    ITEM_STAT_DEFENSE_SHIELD_MOD         1.20

#define    ITEM_SLOT_HEAD_MOD           1.00
#define    ITEM_SLOT_NECK_MOD           1.82
#define    ITEM_SLOT_SHOULDERS_MOD      1.29
#define    ITEM_SLOT_CHEST_MOD          1.00
#define    ITEM_SLOT_WAIST_MOD          1.29
#define    ITEM_SLOT_LEGS_MOD           1.00
#define    ITEM_SLOT_FEET_MOD           1.29
#define    ITEM_SLOT_WRISTS_MOD         1.82
#define    ITEM_SLOT_HANDS_MOD          1.29
#define    ITEM_SLOT_FINGER_MOD         1.82
#define    ITEM_SLOT_TRINKET_MOD        1.43
#define    ITEM_SLOT_SHIELD_MOD         1.82
#define    ITEM_SLOT_RANGED_MOD         3.33
#define    ITEM_SLOT_BACK_MOD           1.82
#define    ITEM_SLOT_2HAND_MOD          1.00
#define    ITEM_SLOT_MAIN_HAND_MOD      2.38
#define    ITEM_SLOT_OFF_HAND_MOD       1.82

enum ITEM_STAT_TYPE
{
    ITEM_STAT_POWER      = 0,
    ITEM_STAT_HEALTH     = 1,
    ITEM_STAT_UNKNOWN    = 2,
    ITEM_STAT_AGILITY    = 3,
    ITEM_STAT_STRENGTH   = 4,
    ITEM_STAT_INTELLECT  = 5,
    ITEM_STAT_SPIRIT     = 6,
    ITEM_STAT_STAMINA    = 7
};

enum ITEM_DAMAGE_TYPE
{
    NORMAL_DAMAGE  = 0,
    HOLY_DAMAGE    = 1,
    FIRE_DAMAGE    = 2,
    NATURE_DAMAGE  = 3,
    FROST_DAMAGE   = 4,
    SHADOW_DAMAGE  = 5,
    ARCANE_DAMAGE  = 6
};

enum ITEM_SPELLTRIGGER_TYPE
{
    USE           = 0,
    ON_EQUIP      = 1,
    CHANCE_ON_HIT = 2,
    SOULSTONE     = 4
};

enum ITEM_BONDING_TYPE
{
    NO_BIND              = 0,
    BIND_WHEN_PICKED_UP  = 1,
    BIND_WHEN_EQUIPED    = 2,
    BIND_WHEN_USE        = 3,
    //TODO: Better name these
    QUEST_ITEM           = 4,
    QUEST_ITEM1          = 5
};

// masks for ITEM_FIELD_FLAGS field
enum ITEM_FLAGS
{
    ITEM_FLAGS_BINDED = 1
};

enum BAG_FAMILY
{
    BAG_FAMILY_NONE                             = 0,
    BAG_FAMILY_ARROWS                           = 1,
    BAG_FAMILY_BULLETS                          = 2,
    BAG_FAMILY_SOUL_SHARDS                      = 3,
    //BAG_FAMILY_UNK1                           = 4,
    //BAG_FAMILY_UNK1                           = 5,
    BAG_FAMILY_HERBS                            = 6,
    BAG_FAMILY_ENCHANTING_SUPP                  = 7,
    BAG_FAMILY_ENGINEERING_SUPP                 = 8,
    BAG_FAMILY_KEYS                             = 9,
    BAG_FAMILY_GEMS                             = 10,
    //BAG_FAMILY_UNK3                           = 11,
    BAG_FAMILY_MINING_SUPP                      = 12
};

enum INVENTORY_TYPES
{
    INVTYPE_NON_EQUIP      = 0,
    INVTYPE_HEAD           = 1,
    INVTYPE_NECK           = 2,
    INVTYPE_SHOULDERS      = 3,
    INVTYPE_BODY           = 4,
    INVTYPE_CHEST          = 5,
    INVTYPE_WAIST          = 6,
    INVTYPE_LEGS           = 7,
    INVTYPE_FEET           = 8,
    INVTYPE_WRISTS         = 9,
    INVTYPE_HANDS          = 10,
    INVTYPE_FINGER         = 11,
    INVTYPE_TRINKET        = 12,
    INVTYPE_WEAPON         = 13,
    INVTYPE_SHIELD         = 14,
    INVTYPE_RANGED         = 15,
    INVTYPE_CLOAK          = 16,
    INVTYPE_2HWEAPON       = 17,
    INVTYPE_BAG            = 18,
    INVTYPE_TABARD         = 19,
    INVTYPE_ROBE           = 20,
    INVTYPE_WEAPONMAINHAND = 21,
    INVTYPE_WEAPONOFFHAND  = 22,
    INVTYPE_HOLDABLE       = 23,
    INVTYPE_AMMO           = 24,
    INVTYPE_THROWN         = 25,
    INVTYPE_RANGEDRIGHT    = 26,
    INVTYPE_SLOT_ITEM      = 27,
    INVTYPE_RELIC          = 28,
    NUM_INVENTORY_TYPES    = 29
};

enum INVENTORY_CLASS
{
    ITEM_CLASS_CONSUMABLE    = 0,
    ITEM_CLASS_CONTAINER     = 1,
    ITEM_CLASS_WEAPON        = 2,
    ITEM_CLASS_JEWELRY       = 3,
    ITEM_CLASS_ARMOR         = 4,
    ITEM_CLASS_REAGENT       = 5,
    ITEM_CLASS_PROJECTILE    = 6,
    ITEM_CLASS_TRADE_GOODS   = 7,
    ITEM_CLASS_GENERIC       = 8,
    ITEM_CLASS_BOOK          = 9,
    ITEM_CLASS_MONEY         = 10,
    ITEM_CLASS_QUIVER        = 11,
    ITEM_CLASS_QUEST         = 12,
    ITEM_CLASS_KEY           = 13,
    ITEM_CLASS_PERMANENT     = 14,
    ITEM_CLASS_JUNK          = 15
};

// Client understand only 0 subclass for ITEM_CLASS_CONSUMABLE
// but this value used in code as implementation workaround
enum ITEM_SUBCLASS_CONSUMABLE
{
    ITEM_SUBCLASS_FOOD                    = 1,
    ITEM_SUBCLASS_LIQUID                  = 2,
    ITEM_SUBCLASS_POTION                  = 3,
    ITEM_SUBCLASS_SCROLL                  = 4,
    ITEM_SUBCLASS_BANDAGE                 = 5,
    ITEM_SUBCLASS_HEALTHSTONE             = 6,
    ITEM_SUBCLASS_COMBAT_EFFECT           = 7
};

enum ITEM_SUBCLASS_CONTAINER
{
    ITEM_SUBCLASS_CONTAINER               = 0,
    ITEM_SUBCLASS_SOUL_CONTAINER          = 1,
    ITEM_SUBCLASS_HERB_CONTAINER          = 2,
    ITEM_SUBCLASS_ENCHANTING_CONTAINER    = 3,
    ITEM_SUBCLASS_ENGINEERING_CONTAINER   = 4
};

enum INVENTORY_SUBCLASS_WEAPON
{
    ITEM_SUBCLASS_WEAPON_AXE           = 0,
    ITEM_SUBCLASS_WEAPON_AXE2          = 1,
    ITEM_SUBCLASS_WEAPON_BOW           = 2,
    ITEM_SUBCLASS_WEAPON_GUN           = 3,
    ITEM_SUBCLASS_WEAPON_MACE          = 4,
    ITEM_SUBCLASS_WEAPON_MACE2         = 5,
    ITEM_SUBCLASS_WEAPON_POLEARM       = 6,
    ITEM_SUBCLASS_WEAPON_SWORD         = 7,
    ITEM_SUBCLASS_WEAPON_SWORD2        = 8,
    ITEM_SUBCLASS_WEAPON_obsolete      = 9,
    ITEM_SUBCLASS_WEAPON_STAFF         = 10,
    ITEM_SUBCLASS_WEAPON_EXOTIC        = 11,
    ITEM_SUBCLASS_WEAPON_EXOTIC2       = 12,
    ITEM_SUBCLASS_WEAPON_UNARMED       = 13,
    ITEM_SUBCLASS_WEAPON_GENERIC       = 14,
    ITEM_SUBCLASS_WEAPON_DAGGER        = 15,
    ITEM_SUBCLASS_WEAPON_THROWN        = 16,
    ITEM_SUBCLASS_WEAPON_SPEAR         = 17,
    ITEM_SUBCLASS_WEAPON_CROSSBOW      = 18,
    ITEM_SUBCLASS_WEAPON_WAND          = 19,
    ITEM_SUBCLASS_WEAPON_FISHING_POLE  = 20
};

enum ITEM_SUBCLASS_ARMOR
{
    ITEM_SUBCLASS_ARMOR_GENERIC     = 0,
    ITEM_SUBCLASS_ARMOR_CLOTH       = 1,
    ITEM_SUBCLASS_ARMOR_LEATHER     = 2,
    ITEM_SUBCLASS_ARMOR_MAIL        = 3,
    ITEM_SUBCLASS_ARMOR_PLATE       = 4,
    ITEM_SUBCLASS_ARMOR_BUCKLER     = 5,
    ITEM_SUBCLASS_ARMOR_SHIELD      = 6
};

enum ITEM_SUBCLASS_PROJECTILE
{
    ITEM_SUBCLASS_ARROW             = 2,
    ITEM_SUBCLASS_BULLET            = 3
};

enum ITEM_SUBCLASS_TRADE_GOODS
{
    ITEM_SUBCLASS_TRADE_GOODS       = 0,
    ITEM_SUBCLASS_PARTS             = 1,
    ITEM_SUBCLASS_EXPLOSIVES        = 2,
    ITEM_SUBCLASS_DEVICES           = 3
};

enum ITEM_SUBCLASS_BOOK
{
    ITEM_SUBCLASS_BOOK                   = 0,
    ITEM_SUBCLASS_LEATHERWORKING_PATTERN = 1,
    ITEM_SUBCLASS_TAILORING_PATTERN      = 2,
    ITEM_SUBCLASS_ENGINEERING_SCHEMATIC  = 3,
    ITEM_SUBCLASS_COOKING_RECIPE         = 5,
    ITEM_SUBCLASS_ALCHEMY_RECIPE         = 6,
    ITEM_SUBCLASS_FIRST_AID_MANUAL       = 7,
    ITEM_SUBCLASS_ENCHANTING_FORMULA     = 8,
    ITEM_SUBCLASS_FISHING_MANUAL         = 9
};

enum ITEM_SUBCLASS_QUIVER
{
    ITEM_SUBCLASS_QUIVER            = 2,
    ITEM_SUBCLASS_AMMO_POUCH        = 3
};

// Only GCC 4.1.0 and later support #pragma pack(push,1) syntax
#if defined( __GNUC__ ) && (GCC_MAJOR < 4 || GCC_MAJOR == 4 && GCC_MINOR < 1)
#pragma pack(1)
#else
#pragma pack(push,1)
#endif

struct _Damage
{
    float DamageMin;
    float DamageMax;
    uint32 DamageType;

};

struct _ItemStat
{
    uint32 ItemStatType;
    int32  ItemStatValue;

};
struct _Spell
{
    uint32 SpellId;
    uint32 SpellTrigger;
    int32  SpellCharges;
    int32  SpellCooldown;
    uint32 SpellCategory;
    int32  SpellCategoryCooldown;

};

struct ItemPrototype
{
    uint32 ItemId;
    uint32 Class;
    uint32 SubClass;
    char* Name1;
    char* Name2;
    char* Name3;
    char* Name4;
    uint32 DisplayInfoID;
    uint32 Quality;
    uint32 Flags;
    uint32 BuyCount;
    uint32 BuyPrice;
    uint32 SellPrice;
    uint32 InventoryType;
    uint32 AllowableClass;
    uint32 AllowableRace;
    uint32 ItemLevel;
    uint32 RequiredLevel;
    uint32 RequiredSkill;
    uint32 RequiredSkillRank;
    uint32 RequiredSpell;
    uint32 RequiredHonorRank;
    uint32 RequiredCityRank;
    uint32 RequiredReputationFaction;
    uint32 RequiredReputationRank;
    uint32 MaxCount;
    uint32 Stackable;
    uint32 ContainerSlots;
    _ItemStat ItemStat[10];
    _Damage Damage[5];
    uint32 Armor;
    uint32 HolyRes;
    uint32 FireRes;
    uint32 NatureRes;
    uint32 FrostRes;
    uint32 ShadowRes;
    uint32 ArcaneRes;
    uint32 Delay;
    uint32 Ammo_type;
    float  RangedModRange;

    _Spell Spells[5];
    uint32 Bonding;
    char* Description;
    uint32 PageText;
    uint32 LanguageID;
    uint32 PageMaterial;
    uint32 StartQuest;
    uint32 LockID;
    uint32 Material;
    uint32 Sheath;
    uint32 Extra;
    uint32 Block;
    uint32 ItemSet;
    uint32 MaxDurability;
    uint32 Area;
    uint32 BagFamily;
    uint32 Unknown1;
    char* ScriptName;
    uint32 DisenchantID;
};

#if defined( __GNUC__ ) && (GCC_MAJOR < 4 || GCC_MAJOR == 4 && GCC_MINOR < 1)
#pragma pack()
#else
#pragma pack(pop)
#endif
#endif
