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

//Razuvious - NO TEXT sound only
//8852 aggro01 - Hah hah, I'm just getting warmed up!
//8853 aggro02 Stand and fight!
//8854 aggro03 Show me what you've got!
//8861 slay1 - You should've stayed home!
//8863 slay2- 
//8858 cmmnd3 - You disappoint me, students!
//8855 cmmnd1 - Do as I taught you!
//8856 cmmnd2 - Show them no mercy!
//8859 cmmnd4 - The time for practice is over! Show me what you've learned!
//8861 Sweep the leg! Do you have a problem with that?
//8860 death - An honorable... death...
//8947 - Aggro Mixed? - ?

#define SOUND_AGGRO1    8852
#define SOUND_AGGRO2    8853
#define SOUND_AGGRO3    8854
#define SOUND_SLAY1     8861
#define SOUND_SLAY2     8863
#define SOUND_COMMND1   8855
#define SOUND_COMMND2   8856
#define SOUND_COMMND3   8858
#define SOUND_COMMND4   8859
#define SOUND_COMMND5   8861
#define SOUND_DEATH     8860
#define SOUND_AGGROMIX  8847

#define SPELL_UNBALANCINGSTRIKE     26613
#define SPELL_DISRUPTINGSHOUT       29107

struct MANGOS_DLL_DECL boss_razuviousAI : public ScriptedAI
{
    boss_razuviousAI(Creature *c) : ScriptedAI(c) {EnterEvadeMode();}

    uint32 UnbalancingStrike_Timer;
    uint32 DisruptingShout_Timer;
    uint32 CommandSound_Timer;
    bool InCombat;

    void EnterEvadeMode()
    {
        UnbalancingStrike_Timer = 30000;    //30 seconds
        DisruptingShout_Timer = 25000;      //25 seconds
        CommandSound_Timer = 40000;         //40 seconds
        InCombat = false;

        m_creature->RemoveAllAuras();
        m_creature->DeleteThreatList();
        m_creature->CombatStop();
        DoGoHome();
    }

    void KilledUnit(Unit* Victim)
    {
        if (rand()%3)
            return;

        switch (rand()%2)
        {
            case 0:
            DoPlaySoundToSet(m_creature, SOUND_SLAY1);
            break;

            case 1:
            DoPlaySoundToSet(m_creature, SOUND_SLAY2);
            break;
        }
    }

    void JustDied(Unit* Killer)
    {
        DoPlaySoundToSet(m_creature, SOUND_DEATH);
    }

    void AttackStart(Unit *who)
    {
        if (!who)
            return;

        if (who->isTargetableForAttack() && who!= m_creature)
        {
            //Begin melee attack if we are within range
            DoStartMeleeAttack(who);

            if (!InCombat)
            {
                switch (rand()%3)
                {
                    case 0:
                    DoPlaySoundToSet(m_creature, SOUND_AGGRO1);
                    break;

                    case 1:
                    DoPlaySoundToSet(m_creature, SOUND_AGGRO2);
                    break;

                    case 2:
                    DoPlaySoundToSet(m_creature, SOUND_AGGRO3);
                    break;
                }
                InCombat = true;
            }
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

                if (!InCombat)
                {
                    switch (rand()%3)
                    {
                        case 0:
                        DoPlaySoundToSet(m_creature, SOUND_AGGRO1);
                        break;

                        case 1:
                        DoPlaySoundToSet(m_creature, SOUND_AGGRO2);
                        break;

                        case 2:
                        DoPlaySoundToSet(m_creature, SOUND_AGGRO3);
                        break;
                    }
                    InCombat = true;
                }
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
            
            //UnbalancingStrike_Timer
            if (UnbalancingStrike_Timer < diff)
            {
                //Cast Unbalancing strike
                DoCast(m_creature->getVictim(),SPELL_UNBALANCINGSTRIKE);

                //30 seconds until we should cast this agian
                UnbalancingStrike_Timer = 30000;
            }else UnbalancingStrike_Timer -= diff;

            //DisruptingShout_Timer
            if (DisruptingShout_Timer < diff)
            {
                //Cast
                DoCast(m_creature->getVictim(), SPELL_DISRUPTINGSHOUT);

                //25 seconds until we should cast this agian
                DisruptingShout_Timer = 25000;
            }else DisruptingShout_Timer -= diff;

            //CommandSound_Timer
            if (CommandSound_Timer < diff)
            {
                //Play a random command sound
                switch (rand()%5)
                {
                    case 0:
                    DoPlaySoundToSet(m_creature, SOUND_COMMND1);
                    break;

                    case 1:
                    DoPlaySoundToSet(m_creature, SOUND_COMMND2);
                    break;

                    case 2:
                    DoPlaySoundToSet(m_creature, SOUND_COMMND3);
                    break;

                    case 3:
                    DoPlaySoundToSet(m_creature, SOUND_COMMND4);
                    break;

                    case 4:
                    DoPlaySoundToSet(m_creature, SOUND_COMMND5);
                    break;
                }

                //40 seconds until we should cast this agian
                CommandSound_Timer = 40000;
            }else CommandSound_Timer -= diff;

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
CreatureAI* GetAI_boss_razuvious(Creature *_Creature)
{
    return new boss_razuviousAI (_Creature);
}


void AddSC_boss_razuvious()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name="boss_razuvious";
    newscript->GetAI = GetAI_boss_razuvious;
    m_scripts[nrscripts++] = newscript;
}