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

#ifndef MANGOSSERVER_GOSSIP_H
#define MANGOSSERVER_GOSSIP_H

#include "Common.h"
#include "QuestDef.h"
#include "NPCHandler.h"

class WorldSession;

#define GOSSIP_MAX_MENU_ITEMS 16
#define DEFAULT_GOSSIP_MESSAGE              0xffffff

//POI defines
enum Poi_Icon
{
    ICON_POI_0                  =   0,                      // Grey ?
    ICON_POI_1                  =   1,                      // Red ?
    ICON_POI_2                  =   2,                      // Blue ?
    ICON_POI_BWTOMB             =   3,                      // Blue and White Tomb Stone
    ICON_POI_HOUSE              =   4,                      // House
    ICON_POI_TOWER              =   5,                      // Tower
    ICON_POI_REDFLAG            =   6,                      // Red Flag with Yellow !
    ICON_POI_TOMB               =   7,                      // Tomb Stone
    ICON_POI_BWTOWER            =   8,                      // Blue and White Tower
    ICON_POI_REDTOWER           =   9,                      // Red Tower
    ICON_POI_BLUETOWER          =   10,                     // Blue Tower
    ICON_POI_RWTOWER            =   11,                     // Red and White Tower
    ICON_POI_REDTOMB            =   12,                     // Red Tomb Stone
    ICON_POI_RWTOMB             =   13,                     // Red and White Tomb Stone
    ICON_POI_BLUETOMB           =   14,                     // Blue Tomb Stone
    ICON_POI_NOTHING            =   15,                     // NOTHING
    ICON_POI_16                 =   16,                     // Red ?
    ICON_POI_17                 =   17,                     // Grey ?
    ICON_POI_18                 =   18,                     // Blue ?
    ICON_POI_19                 =   19,                     // Red and White ?
    ICON_POI_20                 =   20,                     // Red ?
    ICON_POI_GREYLOGS           =   21,                     // Grey Wood Logs
    ICON_POI_BWLOGS             =   22,                     // Blue and White Wood Logs
    ICON_POI_BLUELOGS           =   23,                     // Blue Wood Logs
    ICON_POI_RWLOGS             =   24,                     // Red and White Wood Logs
    ICON_POI_REDLOGS            =   25,                     // Red Wood Logs
    ICON_POI_26                 =   26,                     // Grey ?
    ICON_POI_27                 =   27,                     // Blue and White ?
    ICON_POI_28                 =   28,                     // Blue ?
    ICON_POI_29                 =   29,                     // Red and White ?
    ICON_POI_30                 =   30,                     // Red ?
    ICON_POI_GREYHOUSE          =   31,                     // Grey House
    ICON_POI_BWHOUSE            =   32,                     // Blue and White House
    ICON_POI_BLUEHOUSE          =   33,                     // Blue House
    ICON_POI_RWHOUSE            =   34,                     // Red and White House
    ICON_POI_REDHOUSE           =   35,                     // Red House
    ICON_POI_GREYHORSE          =   36,                     // Grey Horse
    ICON_POI_BWHORSE            =   37,                     // Blue and White Horse
    ICON_POI_BLUEHORSE          =   38,                     // Blue Horse
    ICON_POI_RWHORSE            =   39,                     // Red and White Horse
    ICON_POI_REDHORSE           =   40                      // Red Horse
};

struct GossipMenuItem
{
    uint8       m_gIcon;
    bool        m_gCoded;
    char*       m_gMessage;
    uint32  m_gSender;
    uint32  m_gAction;
};

struct QuestMenuItem
{
    uint32      m_qId;
    uint8       m_qIcon;
};

class MANGOS_DLL_SPEC GossipMenu
{
    public:
        GossipMenu();
        ~GossipMenu();

        void AddMenuItem(uint8 Icon, char const * Message, bool Coded = false);
        void AddMenuItem(uint8 Icon, char const * Message, uint32 dtSender, uint32 dtAction, bool Coded = false);

        unsigned int MenuItemCount()
        {
            return m_gItemsCount;
        }

        GossipMenuItem GetItem( unsigned int Id )
        {
            return m_gItems[ Id ];
        }

        uint32 MenuItemSender( unsigned int ItemId );
        uint32 MenuItemAction( unsigned int ItemId );

        void ClearMenu();

    protected:
        unsigned int m_gItemsCount;
        GossipMenuItem m_gItems[GOSSIP_MAX_MENU_ITEMS];
};

class QuestMenu
{
    public:
        QuestMenu();
        ~QuestMenu();

        void AddMenuItem( uint32 QuestId, uint8 Icon);
        void ClearMenu();

        uint8 MenuItemCount()
        {
            return m_qItemsCount;
        }
        bool HasItem( uint32 questid );

        QuestMenuItem GetItem( uint16 Id )
        {
            return m_qItems[ Id ];
        }

    protected:
        int m_qItemsCount;
        QuestMenuItem m_qItems[GOSSIP_MAX_MENU_ITEMS];
};

class MANGOS_DLL_SPEC PlayerMenu
{
    private:
        GossipMenu* pGossipMenu;
        QuestMenu* pQuestMenu;
        WorldSession* pSession;

    public:
        PlayerMenu( WorldSession *Session );
        ~PlayerMenu();

        GossipMenu* GetGossipMenu() { return pGossipMenu; }
        QuestMenu* GetQuestMenu() { return pQuestMenu; }

        void ClearMenus();
        uint32 GossipOptionSender( unsigned int Selection );
        uint32 GossipOptionAction( unsigned int Selection );

        void SendGossipMenu( uint32 TitleTextId, uint64 npcGUID );
        void CloseGossip();
        void SendPointOfInterest( float X, float Y, uint32 Icon, uint32 Flags, uint32 Data, const char * locName );
        void SendTalking( uint32 textID );
        void SendTalking( char const * title, char const * text );

        /*********************************************************/
        /***                    QUEST SYSTEM                   ***/
        /*********************************************************/
        void SendQuestGiverStatus( uint32 questStatus, uint64 npcGUID );

        void SendQuestGiverQuestList( QEmote eEmote, std::string Title, uint64 npcGUID );

        void SendQuestQueryResponse ( Quest *pQuest );
        void SendQuestGiverQuestDetails( Quest *pQuest, uint64 npcGUID, bool ActivateAccept);

        void SendQuestGiverOfferReward( uint32 quest_id, uint64 npcGUID, bool EnbleNext, QEmote Emotes[], unsigned int EmoteCnt );
        void SendQuestGiverRequestItems( Quest *pQuest, uint64 npcGUID, bool Completable, bool CloseOnCancel );
};
#endif
