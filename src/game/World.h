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

/// \addtogroup world The World
/// @{
/// \file

#ifndef __WORLD_H
#define __WORLD_H

#include "Common.h"
#include "Timer.h"
#include "Policies/Singleton.h"
using namespace std;

class Object;
class WorldPacket;
class WorldSession;
class Player;
class Weather;
struct ScriptAction;
struct ScriptInfo;

/// Timers for different object refresh rates
enum WorldTimers
{
    WUPDATE_OBJECTS = 0,
    WUPDATE_SESSIONS = 1,
    WUPDATE_AUCTIONS = 2,
    WUPDATE_WEATHERS = 3,
    WUPDATE_COUNT = 4
};

/// Configuration elements
enum WorldConfigs
{
    CONFIG_COMPRESSION = 0,
    CONFIG_GRID_UNLOAD,
    CONFIG_INTERVAL_SAVE,
    CONFIG_INTERVAL_GRIDCLEAN,
    CONFIG_INTERVAL_MAPUPDATE,
    CONFIG_INTERVAL_CHANGEWEATHER,
    CONFIG_PORT_WORLD,
    CONFIG_SOCKET_SELECTTIME,
    CONFIG_GROUP_XP_DISTANCE,
    CONFIG_GROUP_XP_LEVELDIFF,
    CONFIG_SIGHT_MONSTER,
    CONFIG_SIGHT_GUARDER,
    CONFIG_GAME_TYPE,
    CONFIG_ALLOW_TWO_SIDE_ACCOUNTS,
    CONFIG_ALLOW_TWO_SIDE_INTERACTION_CHAT,
    CONFIG_ALLOW_TWO_SIDE_INTERACTION_CHANNEL,
    CONFIG_ALLOW_TWO_SIDE_INTERACTION_GROUP,
    CONFIG_ALLOW_TWO_SIDE_INTERACTION_GUILD,
    CONFIG_ALLOW_TWO_SIDE_INTERACTION_TRADE,
    CONFIG_ALLOW_TWO_SIDE_WHO_LIST,
    CONFIG_MAX_PLAYER_LEVEL,
    CONFIG_IGNORE_AT_LEVEL_REQUIREMENT,
    CONFIG_MAX_PRIMARY_TRADE_SKILL,
    CONFIG_MIN_PETITION_SIGNS,
    CONFIG_GM_WISPERING_TO,
    CONFIG_GM_IN_GM_LIST,
    CONFIG_GM_IN_WHO_LIST,
    CONFIG_GM_LOGIN_STATE,
    CONFIG_GM_LOG_TRADE,
    CONFIG_GROUP_VISIBILITY,
    CONFIG_SKILL_CHANCE_ORANGE,
    CONFIG_SKILL_CHANCE_YELLOW,
    CONFIG_SKILL_CHANCE_GREEN,
    CONFIG_SKILL_CHANCE_GREY,
    CONFIG_MAX_OVERSPEED_PINGS,
    CONFIG_SAVE_RESPAWN_TIME_IMMEDIATLY,
    CONFIG_WEATHER,
    CONFIG_VALUE_COUNT
};

/// Server rates
enum Rates
{
    RATE_HEALTH=0,
    RATE_POWER_MANA,
    RATE_POWER_RAGE,
    RATE_POWER_FOCUS,
    RATE_DROP_ITEMS,
    RATE_DROP_MONEY,
    RATE_XP_KILL,
    RATE_XP_QUEST,
    RATE_XP_EXPLORE,
    RATE_CREATURE_NORMAL_HP,
    RATE_CREATURE_ELITE_ELITE_HP,
    RATE_CREATURE_ELITE_RAREELITE_HP,
    RATE_CREATURE_ELITE_WORLDBOSS_HP,
    RATE_CREATURE_ELITE_RARE_HP,
    RATE_CREATURE_NORMAL_DAMAGE,
    RATE_CREATURE_ELITE_ELITE_DAMAGE,
    RATE_CREATURE_ELITE_RAREELITE_DAMAGE,
    RATE_CREATURE_ELITE_WORLDBOSS_DAMAGE,
    RATE_CREATURE_ELITE_RARE_DAMAGE,
    RATE_CREATURE_AGGRO,
    RATE_REST_INGAME,
    RATE_REST_OFFLINE_IN_TAVERN_OR_CITY,
    RATE_REST_OFFLINE_IN_WILDERNESS,
    RATE_DAMAGE_FALL,
    MAX_RATES
};

/// Type of environmental damages
enum EnviromentalDamage
{
    DAMAGE_EXHAUSTED = 0,
    DAMAGE_DROWNING = 1,
    DAMAGE_FALL = 2,
    DAMAGE_LAVA = 3,
    DAMAGE_SLIME = 4,
    DAMAGE_FIRE = 5
};

/// Type of server
enum RealmType
{
    REALM_NORMAL = 0,
    REALM_PVP = 1,
    REALM_NORMAL2 = 4,
    REALM_RP = 6,
    REALM_RPPVP = 8
};

/// The World
class World
{
    public:
        static volatile bool m_stopEvent;

        World();
        ~World();

        WorldSession* FindSession(uint32 id) const;
        void AddSession(WorldSession *s);
        bool RemoveSession(uint32 id);
        /// Get the number of current active sessions
        uint32 GetSessionCount() const { return m_sessions.size(); }
        /// Get the maximum number of parallel sessions on the server since last reboot
        uint32 GetMaxSessionCount() const { return m_maxSessionsCount; }
        Player* FindPlayerInZone(uint32 zone);

        Weather* FindWeather(uint32 id) const;
        Weather* AddWeather(uint32 zone_id);
        void RemoveWeather(uint32 zone_id);

        /// Get the active session server limit
        uint32 GetPlayerLimit() const { return m_playerLimit; }
        /// Set the active session server limit
        void SetPlayerLimit(uint32 limit) { m_playerLimit = limit; }

        /// \todo Actions on m_allowMovement still to be implemented
        /// Is movement allowed?
        bool getAllowMovement() const { return m_allowMovement; }
        /// Allow/Disallow object movements
        void SetAllowMovement(bool allow) { m_allowMovement = allow; }

        /// Set a new Message of the Day
        void SetMotd(const char *motd) { m_motd = motd; }
        /// Get the current Message of the Day
        const char* GetMotd() const { return m_motd.c_str(); }

        /// Get the path where data (dbc, maps) are stored on disk
        std::string GetDataPath() const { return m_dataPath; }

        /// When server started?
        time_t const& GetStartTime() const { return m_startTime; }
        /// What time is it?
        time_t const& GetGameTime() const { return m_gameTime; }
        /// Uptime (in secs)
        uint32 GetUptime() const { return uint32(m_gameTime - m_startTime); }

        /// Get the maximum skill level a player can reach
        uint16 GetConfigMaxSkillValue() const { return getConfig(CONFIG_MAX_PLAYER_LEVEL)*5; }

        void SetInitialWorldSettings();

        void SendWorldText(const char *text, WorldSession *self = 0);
        void SendGlobalMessage(WorldPacket *packet, WorldSession *self = 0);
        void SendZoneMessage(uint32 zone, WorldPacket *packet, WorldSession *self = 0, uint32 security = 0);
        void SendZoneText(uint32 zone, const char *text, WorldSession *self = 0, uint32 security = 0);
        void SendServerMessage(uint32 type, const char *text = "", Player* player = NULL);

        /// Are we in the middle of a shutdown?
        bool IsShutdowning() const { return m_ShutdownTimer > 0; }
        void ShutdownServ(uint32 time, bool idle = false);
        void ShutdownCancel();
        void ShutdownMsg(bool show = false, Player* player = NULL);

        void Update(time_t diff);

        /// Set a server rate (see #Rates)
        void setRate(Rates rate,float value) { rate_values[rate]=value; }
        /// Get a server rate (see #Rates)
        float getRate(Rates rate) const { return rate_values[rate]; }

        /// Set a server configuration element (see #WorldConfigs)
        void setConfig(uint32 index,uint32 value)
        {
            if(index<CONFIG_VALUE_COUNT)
                m_configs[index]=value;
        }

        /// Get a server configuration element (see #WorldConfigs)
        uint32 getConfig(uint32 index) const
        {
            if(index<CONFIG_VALUE_COUNT)
                return m_configs[index];
            else
                return 0;
        }

        /// Are we on a "Player versus Player" server?
        bool IsPvPRealm() { return (getConfig(CONFIG_GAME_TYPE) == REALM_PVP || getConfig(CONFIG_GAME_TYPE) == REALM_RPPVP); }

        bool KickPlayer(std::string playerName);
        void KickAll();
        bool BanAccount(std::string nameOrIP);
        bool RemoveBanAccount(std::string nameOrIP);

        void ScriptsStart(map<uint32, multimap<uint32, ScriptInfo> > const& scripts, uint32 id, Object* source, Object* target);

    protected:

        void _UpdateGameTime();
        void ScriptsProcess();

    private:

        time_t m_startTime;
        time_t m_gameTime;
        IntervalTimer m_timers[WUPDATE_COUNT];
        uint32 mail_timer;
        uint32 mail_timer_expires;

        typedef HM_NAMESPACE::hash_map<uint32, Weather*> WeatherMap;
        WeatherMap m_weathers;
        typedef HM_NAMESPACE::hash_map<uint32, WorldSession*> SessionMap;
        SessionMap m_sessions;
        uint32 m_maxSessionsCount;
        std::set<WorldSession*> m_kicked_sessions;

        multimap<uint64, ScriptAction> scriptSchedule;

        float rate_values[MAX_RATES];
        uint32 m_configs[CONFIG_VALUE_COUNT];
        uint32 m_playerLimit;
        bool m_allowMovement;
        std::string m_motd;
        std::string m_dataPath;

        uint32 m_ShutdownIdleMode;
        uint32 m_ShutdownTimer;
};

extern uint32 realmID;

#define sWorld MaNGOS::Singleton<World>::Instance()
#endif
/// @}
