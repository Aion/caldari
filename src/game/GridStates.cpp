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

#include "GridStates.h"
#include "GridNotifiers.h"
#include "ObjectAccessor.h"
#include "GameSystem/Grid.h"
#include "Log.h"

void
InvalidState::Update(Map &, NGridType &, GridInfo &, const uint32 &x, const uint32 &y, const uint32 &) const
{
}

void
ActiveState::Update(Map &m, NGridType &grid, GridInfo & info, const uint32 &x, const uint32 &y, const uint32 &t_diff) const
{
    if( grid.ActiveObjectsInGrid() == 0 && !ObjectAccessor::Instance().PlayersNearGrid(x, y, m.GetId(), m.GetInstanceId()) )
    {
        ObjectGridStoper stoper(grid);
        stoper.StopN();
        grid.SetGridState(GRID_STATE_IDLE);
    }
}

void
IdleState::Update(Map &m, NGridType &grid, GridInfo &info, const uint32 &x, const uint32 &y, const uint32 &) const
{
    m.ResetGridExpiry(info);
    grid.SetGridState(GRID_STATE_REMOVAL);
    sLog.outDebug("Grid[%u,%u] on map %u moved to IDLE state", x, y, m.GetId());
}

void
RemovalState::Update(Map &m, NGridType &grid, GridInfo &info, const uint32 &x, const uint32 &y, const uint32 &t_diff) const
{
    if(info.i_unloadflag)
    {
        info.i_timer.Update(t_diff);
        if( info.i_timer.Passed() )
        {
            if( !m.UnloadGrid(x, y) )
            {
                sLog.outDebug("Grid[%u,%u] for map %u differed unloading due to players nearby", x, y, m.GetId());
                m.ResetGridExpiry(info);
            }
        }
    }
}
