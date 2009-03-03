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

#define SPELL_RUSHINGCHARGE         32021
#define SPELL_RUSHINGCHARGE1        6268

#define SPELL_CLEAVE	            11608
#define SPELL_WHIRLWIND	            8989
#define SPELL_SUNDERARMOR	        16145
#define SPELL_REND			        21949
#define SPELL_THUNDERCLAP           15588
#define SPELL_SLAM		            11430
#define SPELL_BERSERKERSTANCE       2458
#define SPELL_ENRAGE	            28747
#define SPELL_FIREBALL11            10151
#define SPELL_CONEOFCOLD5           10161

#define SAY_AGGRO			"Ah, I have been waiting for a real challenge!"
#define SAY_WHIRLWIND	    "Blades of Light!"
#define SAY_ENRAGE		    "Light, give me strength!"
#define SAY_DEATH		    "Ha, is that all?"

#define SOUND_AGGRO			5830
#define SOUND_WHIRLWIND		5832
#define SOUND_ENRAGE		5833
#define SOUND_DEATH			5831

struct MANGOS_DLL_DECL boss_herodAI : public ScriptedAI
{
    boss_herodAI(Creature *c) : ScriptedAI(c) {EnterEvadeMode();}

    uint32 Yell_Timer;
    uint32 Enrage_Timer;
    uint32 Cleave_Timer;
    uint32 Whirlwind_Timer;
    uint32 SunderArmor_Timer;
    uint32 Rend_Timer;
    uint32 ThunderClap_Timer;
    uint32 Slam_Timer;
    uint32 Fireball11_Timer;
    uint32 ConeOfCold5_Timer;
    bool InCombat;

    void EnterEvadeMode()
    {
        Yell_Timer = 58000;
        Whirlwind_Timer = 60000;
        Enrage_Timer = 0;
        Cleave_Timer = 15000;
        SunderArmor_Timer = 40000;
        Rend_Timer = 25000;
        ThunderClap_Timer = 25000;
        Slam_Timer = 20000;
        Fireball11_Timer = 30000;
        ConeOfCold5_Timer = 40000;
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
            //Say our dialog
            DoYell(SAY_AGGRO,LANG_UNIVERSAL,NULL);
            DoPlaySoundToSet(m_creature,SOUND_AGGRO);

            //Activate Berserker Stance
            DoCast(m_creature,SPELL_BERSERKERSTANCE);

            //Switch between 2 different charge methods
            switch (rand()%2)
                {
                case 0:
                    DoCast(m_creature,SPELL_RUSHINGCHARGE);
                    break;
            
                case 1:
                    DoCast(m_creature,SPELL_RUSHINGCHARGE1);
                    break;
                }

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

                //Switch between 2 different charge methods
                switch (rand()%2)
                    {
                    case 0:
                        DoCast(m_creature,SPELL_RUSHINGCHARGE);
                        break;
                
                    case 1:
                        DoCast(m_creature,SPELL_RUSHINGCHARGE1);
                        break;
                    }

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

            //If we are <10% hp goes Enraged
            if ( m_creature->GetHealth()*100 / m_creature->GetMaxHealth() <= 10 && !m_creature->m_currentSpell && Enrage_Timer < diff)
            {
                DoYell(SAY_ENRAGE,LANG_UNIVERSAL,NULL);
                DoPlaySoundToSet(m_creature,SOUND_ENRAGE);

                DoCast(m_creature,SPELL_ENRAGE);

                //Shouldn't cast this agian
                Enrage_Timer = diff;
            }
            
            //Cleave_Timer
            if (Cleave_Timer < diff)
            {
                //Cast
                DoCast(m_creature->getVictim(),SPELL_CLEAVE);

                //30 seconds until we should cast this agian
                Cleave_Timer = 15000;
            }else Cleave_Timer -= diff;

            //Yelling and Whirlwind casting
            if (Yell_Timer < diff)
            {
                //Say Whirlwind monologe
                DoYell(SAY_WHIRLWIND,LANG_UNIVERSAL,NULL);
                DoPlaySoundToSet(m_creature,SOUND_WHIRLWIND);
                Yell_Timer = 30000;
            }else Yell_Timer -= diff;

            if (Whirlwind_Timer < diff)
            {
                //Cast
                DoCast(m_creature->getVictim(),SPELL_WHIRLWIND);
                Whirlwind_Timer = 30000;
            }else Whirlwind_Timer -= diff;

            //SunderArmor_Timer
            if (SunderArmor_Timer < diff)
            {
                //Cast
                DoCast(m_creature->getVictim(),SPELL_SUNDERARMOR);

                //40 seconds until we should cast this agian
                SunderArmor_Timer = 40000;
            }else SunderArmor_Timer -= diff;

            //Rend_Timer
            if (Rend_Timer < diff)
            {
                //Cast
                DoCast(m_creature->getVictim(),SPELL_REND);

                //45 seconds until we should cast this agian
                Rend_Timer = 25000;
            }else Rend_Timer -= diff;

            //ThunderClap_Timer
            if (ThunderClap_Timer < diff)
            {
                //Cast
                DoCast(m_creature->getVictim(),SPELL_THUNDERCLAP);

                //45 seconds until we should cast this agian
                ThunderClap_Timer = 20000;
            }else ThunderClap_Timer -= diff;

            //Slam_Timer
            if (Slam_Timer < diff)
            {
                //Cast
                DoCast(m_creature->getVictim(),SPELL_SLAM);

                //30 seconds until we should cast this agian
                Slam_Timer = 20000;
            }else Slam_Timer -= diff;

            //Fireball11_Timer
            if (Fireball11_Timer < diff)
            {
                //Cast
                DoCast(m_creature->getVictim(),SPELL_FIREBALL11);

                //30 seconds until we should cast this agian
                Fireball11_Timer = 30000;
            }else Fireball11_Timer -= diff;

            //ConeOfCold5_Timer
            if (ConeOfCold5_Timer < diff)
            {
                //Cast
                DoCast(m_creature->getVictim(),SPELL_CONEOFCOLD5);

                //190 seconds until we should cast this agian
                ConeOfCold5_Timer = 40000;
            }else ConeOfCold5_Timer -= diff;

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

CreatureAI* GetAI_boss_herod(Creature *_Creature)
{
    return new boss_herodAI (_Creature);
}


void AddSC_boss_herod()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name="boss_herod";
    newscript->GetAI = GetAI_boss_herod;
    m_scripts[nrscripts++] = newscript;
}