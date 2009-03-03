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

// **** This script is still under Developement ****

#define SPELL_MORTALWOUND 25646
#define SPELL_SANDTRAP 25656
#define SPELL_ENRAGE 28798


struct MANGOS_DLL_DECL boss_kurinnaxxAI : public ScriptedAI
{
    boss_kurinnaxxAI(Creature *c) : ScriptedAI(c) {EnterEvadeMode();}

    Unit *pTarget;
	uint32 MORTALWOUND_Timer;
    uint32 SANDTRAP_Timer;
	uint32 i;

    void EnterEvadeMode()
    {
		i=0;
        pTarget = NULL;
		MORTALWOUND_Timer = 30000;
		SANDTRAP_Timer = 30000;

        m_creature->RemoveAllAuras();
        m_creature->DeleteThreatList();
        m_creature->CombatStop();
        DoGoHome();
    }

    void AttackStart(Unit *who)
    {
        if (!who)
            return;

        if (who->isTargetableForAttack() && who!= m_creature)
        {
            //Begin melee attack if we are within range
            if (m_creature->IsWithinDistInMap(who, ATTACK_DIST))
				DoStartMeleeAttack(who);
            else DoStartRangedAttack(who);
			
			pTarget = who;
        }
    }

    void MoveInLineOfSight(Unit *who)
    {
        if (!who || m_creature->getVictim())
            return;

        if (who->isTargetableForAttack() && IsVisible(who) && who->isInAccessablePlaceFor(m_creature) && m_creature->IsHostileTo(who))
        {
            float attackRadius = m_creature->GetAttackDistance(who);
            if (m_creature->IsWithinDistInMap(who, attackRadius) && m_creature->GetDistanceZ(who) <= CREATURE_Z_ATTACK_RANGE)
            {
                if(who->HasStealthAura())
                    who->RemoveSpellsCausingAura(SPELL_AURA_MOD_STEALTH);
                //Begin melee attack if we are within range
                DoStartMeleeAttack(who);

                pTarget = who;
            }
        }
    }

    void UpdateAI(const uint32 diff)
    {
        //Return since we have no target
        if (!m_creature->SelectHostilTarget())
            return;

        //Check if we have a current target
        if( m_creature->getVictim() && m_creature->isAlive())
        {
            //Check if we should stop attacking because our victim is no longer attackable
            if (needToStop())
            {
                EnterEvadeMode();
                return;
            }

            //If we are <30% cast enrage
            if (i==0 && m_creature->GetHealth()*100 / m_creature->GetMaxHealth() <= 30 && !m_creature->m_currentSpell)
            {
				i=1;
			DoCast(m_creature->getVictim(),SPELL_ENRAGE);
            }
            
            //MORTALWOUND_Timer
            if (MORTALWOUND_Timer < diff)
            {
                //Cast
				DoCast(m_creature->getVictim(),SPELL_MORTALWOUND);

                //30 seconds until we should cast this agian
                MORTALWOUND_Timer = 30000;
            }else MORTALWOUND_Timer -= diff;

            //SANDTRAP_Timer
            if (SANDTRAP_Timer < diff)
            {
                //Cast
                DoCast(m_creature->getVictim(),SPELL_SANDTRAP);

                //30 seconds until we should cast this agian
                SANDTRAP_Timer = 30000;
            }else SANDTRAP_Timer -= diff;



            //If we are within range melee the target
            if( m_creature->IsWithinDistInMap(m_creature->getVictim(), ATTACK_DIST))
            {
                //Make sure our attack is ready and we arn't currently casting
                if( m_creature->isAttackReady() && !m_creature->m_currentSpell)
                {
                    m_creature->AttackerStateUpdate(m_creature->getVictim());
                    m_creature->resetAttackTimer();
                }
            }
        }
    }
}; 
CreatureAI* GetAI_boss_kurinnaxx(Creature *_Creature)
{
    return new boss_kurinnaxxAI (_Creature);
}


void AddSC_boss_kurinnaxx()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name="boss_kurinnaxx";
    newscript->GetAI = GetAI_boss_kurinnaxx;
    m_scripts[nrscripts++] = newscript;
}