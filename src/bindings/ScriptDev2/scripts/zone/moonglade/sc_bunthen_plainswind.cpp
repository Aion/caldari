/* Copyright (C) 2006,2007 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
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

#include "../../sc_defines.h"

bool GossipHello_bunthen_plainswind(Player *player, Creature *_Creature)
{
    if (player->getClass() != CLASS_DRUID || player->GetTeam() != HORDE)
        return false;

    player->ADD_GOSSIP_ITEM( 0, "I'd like to fly to Thunder Bluff.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);

    player->SEND_GOSSIP_MENU(4918,_Creature->GetGUID());

    return true;
}

/*******************************************************
 *				Start of GOSSIP_MENU
 *******************************************************/

void SendDefaultMenu_bunthen_plainswind(Player *player, Creature *_Creature, uint32 action)
{
    if (action == GOSSIP_ACTION_INFO_DEF + 1 && player->getClass() == CLASS_DRUID && player->GetTeam() == HORDE)
    {
        std::vector<uint32> nodes;

        nodes.resize(2);
        nodes[0] = 63; // Nighthaven, Moonglade
        nodes[1] = 22; // Thunder Bluff, Mulgore
        player->ActivateTaxiPathTo(nodes);
    }
}

bool GossipSelect_bunthen_plainswind(Player *player, Creature *_Creature, uint32 sender, uint32 action )
{
    if (sender == GOSSIP_SENDER_MAIN)
        SendDefaultMenu_bunthen_plainswind(player, _Creature, action);

    return true;
}

/*******************************************************
 *				End of GOSSIP_MENU
 *******************************************************/

void AddSC_bunthen_plainswind()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name="bunthen_plainswind";
    newscript->pGossipHello          = &GossipHello_bunthen_plainswind;
    newscript->pGossipSelect         = &GossipSelect_bunthen_plainswind;

    m_scripts[nrscripts++] = newscript;
}
