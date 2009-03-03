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

#define SPELL_TRAMPLE 15550
#define SPELL_DRAINMANA 27256
#define SPELL_ARCANEERUPTION 25672 
#define SPELL_SUMMONMANA 25681
#define SPELL_GRDRSLEEP 24360 //Greater Dreamless Sleep  
#define SAY_MANA	    "moam bristles with energy!"

struct MANGOS_DLL_DECL boss_moamAI : public ScriptedAI
{
    boss_moamAI(Creature *c) : ScriptedAI(c) {EnterEvadeMode();}

    Unit *pTarget;
	uint32 TRAMPLE_Timer;
    uint32 DRAINMANA_Timer;
	uint32 SUMMONMANA_Timer;
	uint32 i;
	uint32 j;

    void EnterEvadeMode()
    {
		i=0;
		j=0;
        pTarget = NULL;
		TRAMPLE_Timer = 30000;
		DRAINMANA_Timer = 30000;

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

			//If we are 100%MANA cast Arcane Erruption
            //if (j==1 && m_creature->GetMana()*100 / m_creature->GetMaxMana() == 100 && !m_creature->m_currentSpell)
            {
				DoCast(m_creature->getVictim(),SPELL_ARCANEERUPTION);
				DoYell(SAY_MANA,LANG_UNIVERSAL,NULL);
            }

            //If we are <50%HP cast MANA FIEND (Summon Mana) and Sleep
            //if (i==0 && m_creature->GetHealth()*100 / m_creature->GetMaxHealth() <= 50 && !m_creature->m_currentSpell)
            {
				i=1;
			DoCast(m_creature->getVictim(),SPELL_SUMMONMANA);
			DoCast(m_creature->getVictim(),SPELL_GRDRSLEEP);
            }

             //SUMMONMANA_Timer
            if (i==1 && SUMMONMANA_Timer < diff)
            {
                //Cast
				DoCast(m_creature->getVictim(),SPELL_SUMMONMANA);
				                //90 seconds until we should cast this agian
                SUMMONMANA_Timer = 90000;
            }else SUMMONMANA_Timer -= diff;

            //TRAMPLE_Timer
            if (TRAMPLE_Timer < diff)
            {
                //Cast
				DoCast(m_creature->getVictim(),SPELL_TRAMPLE);
				j=1;
                //30 seconds until we should cast this agian
                TRAMPLE_Timer = 30000;
            }else TRAMPLE_Timer -= diff;

            //DRAINMANA_Timer
            if (DRAINMANA_Timer < diff)
            {
                //Cast
                DoCast(m_creature->getVictim(),SPELL_DRAINMANA);

                //30 seconds until we should cast this agian
                DRAINMANA_Timer = 30000;
            }else DRAINMANA_Timer -= diff;



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
CreatureAI* GetAI_boss_moam(Creature *_Creature)
{
    return new boss_moamAI (_Creature);
}


void AddSC_boss_moam()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name="boss_moam";
    newscript->GetAI = GetAI_boss_moam;
    m_scripts[nrscripts++] = newscript;
}