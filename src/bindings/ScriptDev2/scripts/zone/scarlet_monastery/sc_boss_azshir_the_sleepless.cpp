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

#define SPELL_CALLOFTHEGRAVE        17831
#define SPELL_TERRIFY			    7399
#define SPELL_SOULSIPHON		    7290

struct MANGOS_DLL_DECL boss_azshir_the_sleeplessAI : public ScriptedAI
{
    boss_azshir_the_sleeplessAI(Creature *c) : ScriptedAI(c) {EnterEvadeMode();}

    uint32 SoulSiphon_Timer;
    uint32 CallOftheGrave_Timer;
    uint32 Terrify_Timer;
    bool InCombat;

    void EnterEvadeMode()
    {
        SoulSiphon_Timer = 1;
        CallOftheGrave_Timer = 30000;
        Terrify_Timer = 20000;
        InCombat = false;

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
            DoStartMeleeAttack(who);
            InCombat = true;
        }
    }

    void MoveInLineOfSight(Unit *who)
    {
        if (!who || m_creature->getVictim())
            return;

        if (who->isTargetableForAttack() && who->isInAccessablePlaceFor(m_creature) && m_creature->IsHostileTo(who))
        {
            float attackRadius = m_creature->GetAttackDistance(who);
            if (m_creature->IsWithinDistInMap(who, attackRadius) && m_creature->GetDistanceZ(who) <= CREATURE_Z_ATTACK_RANGE)
            {
                if(who->HasStealthAura())
                    who->RemoveSpellsCausingAura(SPELL_AURA_MOD_STEALTH);

                //Begin melee attack if we are within range
                DoStartMeleeAttack(who);
                InCombat = true;
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
            //If we are <50% hp cast Soul Siphon rank 1
            if ( m_creature->GetHealth()*100 / m_creature->GetMaxHealth() <= 50 && !m_creature->m_currentSpell)
            {
                //SoulSiphon_Timer
                if (SoulSiphon_Timer < diff)
                {

                    DoCast(m_creature->getVictim(),SPELL_SOULSIPHON);
                    return;
    
                    //180 seconds until we should cast this agian
                    SoulSiphon_Timer = 20000;
                }else SoulSiphon_Timer -= diff;
            }

            //CallOfTheGrave_Timer
            if (CallOftheGrave_Timer < diff)
            {
                //Cast
                DoCast(m_creature->getVictim(),SPELL_CALLOFTHEGRAVE);

                //70 seconds until we should cast this agian
                CallOftheGrave_Timer = 30000;
            }else CallOftheGrave_Timer -= diff;

            //Terrify_Timer
            if (Terrify_Timer < diff)
            {
                //Cast
                DoCast(m_creature->getVictim(),SPELL_TERRIFY);

                //45 seconds until we should cast this agian
                Terrify_Timer = 20000;
            }else Terrify_Timer -= diff;

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

CreatureAI* GetAI_boss_azshir_the_sleepless(Creature *_Creature)
{
    return new boss_azshir_the_sleeplessAI (_Creature);
}

void AddSC_boss_azshir_the_sleepless()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name="boss_azshir_the_sleepless";
    newscript->GetAI = GetAI_boss_azshir_the_sleepless;
    m_scripts[nrscripts++] = newscript;
}