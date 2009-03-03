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

#ifndef MANGOS_DESTINATION_HOLDER_H
#define MANGOS_DESTINATION_HOLDER_H

#include "Platform/Define.h"
#include "Timer.h"

class WorldObject;

#define TRAVELLER_UPDATE_INTERVAL  300

template<typename TRAVELLER>
class MANGOS_DLL_DECL DestinationHolder
{
    TimeTracker i_tracker;
    uint32 i_totalTravelTime;
    uint32 i_timeStarted;
    uint32 i_timeElapsed;
    bool i_destSet;
    float i_fromX, i_fromY, i_fromZ;
    float i_destX, i_destY, i_destZ;

    public:
        DestinationHolder() : i_tracker(TRAVELLER_UPDATE_INTERVAL), i_totalTravelTime(0), i_timeStarted(0),
            i_fromX(0), i_fromY(0), i_fromZ(0), i_destX(0), i_destY(0), i_destZ(0), i_timeElapsed(0), i_destSet(false) {}

        uint32 SetDestination(TRAVELLER &traveller, float dest_x, float dest_y, float dest_z);
        inline bool UpdateExpired(void) const { return i_tracker.Passed(); }
        inline void ResetUpdate(uint32 t = TRAVELLER_UPDATE_INTERVAL) { i_tracker.Reset(t); }
        inline uint32 GetTotalTravelTime(void) const { return i_totalTravelTime; }
        inline uint32 GetStartTravelTime(void) const { return i_timeStarted; }
        inline bool HasDestination(void) const { return i_destSet; }
        inline bool HasArrived(void) const { return (i_totalTravelTime == 0 || i_timeElapsed >= i_totalTravelTime); }
        bool UpdateTraveller(TRAVELLER &traveller, uint32 diff, bool force_update);
        uint32 StartTravel(TRAVELLER &traveller);
        void GetLocationNow(float &x, float &y, float &z) const;
        float GetDistanceFromDestSq(const WorldObject &obj) const;

    private:
        void _findOffSetPoint(float x1, float y1, float x2, float y2, float offset, float &x, float &y);

};
#endif
