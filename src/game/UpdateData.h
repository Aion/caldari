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

#ifndef __UPDATEDATA_H
#define __UPDATEDATA_H

class WorldPacket;

enum OBJECT_UPDATE_TYPE
{
    UPDATETYPE_VALUES = 0,

    UPDATETYPE_MOVEMENT = 1,

    UPDATETYPE_CREATE_OBJECT = 2,

    UPDATETYPE_CREATE_OBJECT2 = 3,
    UPDATETYPE_OUT_OF_RANGE_OBJECTS = 4,
    UPDATETYPE_NEAR_OBJECTS = 5

};

class UpdateData
{
    public:
        UpdateData();

        void AddOutOfRangeGUID(const uint64 &guid);
        void AddUpdateBlock(const ByteBuffer &block);
        bool BuildPacket(WorldPacket *packet);
        bool HasData() { return m_blockCount > 0 || m_outOfRangeGUIDs.size() > 0; }
        void Clear();

    protected:
        uint32 m_blockCount;
        std::set<uint64> m_outOfRangeGUIDs;
        ByteBuffer m_data;

        void Compress(void* dst, uint32 *dst_size, void* src, int src_size);
};
#endif
