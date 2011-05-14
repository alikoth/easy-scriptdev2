/* Copyright (C) 2006 - 2011 ScriptDev2 <http://www.scriptdev2.com/>
 * This program is free software licensed under GPL version 2
 * Please see the included DOCS/LICENSE.TXT for more information */

#ifndef DEF_DRAKTHARON_KEEP_H
#define DEF_DRAKTHARON_KEEP_H

enum
{
    MAX_ENCOUNTER                   = 4,

    TYPE_TROLLGORE                  = 0,
    TYPE_NOVOS                      = 1,
    TYPE_KING_DRED                  = 2,
    TYPE_THARONJA                   = 3,
    TYPE_CRYSTAL_EVENT              = 4,

    NPC_KING_DRED                   = 27483,
    NPC_NOVOS                       = 26631,

    // crystal action
    DEACTIVATE_ONE                  = 0,
    RESET                           = 1,
    ACTIVATE_BEAMS                  = 2,

    CRYSTAL_NUMBER                  = 4,

    GO_RITUAL_CRYSTAL_SW            = 189299,
    GO_RITUAL_CRYSTAL_NE            = 189300,
    GO_RITUAL_CRYSTAL_NW            = 189301,
    GO_RITUAL_CRYSTAL_SE            = 189302,
    NPC_CRYSTAL_CHANNEL_TARGET      = 26712,
    SPELL_CHANNEL_BEAM              = 52106,

    // Adds of King Dred Encounter - deaths counted for achievement
    NPC_DRAKKARI_GUTRIPPER          = 26641,
    NPC_DRAKKARI_SCYTHECLAW         = 26628,

    // Achievement Criterias to be handled with SD2
    ACHIEV_CRIT_BETTER_OFF_DREAD    = 7318,
    ACHIEV_CRIT_CONSUME_JUNCTION    = 7579,
    ACHIEV_CRIT_OH_NOVOS            = 7361,
};

class MANGOS_DLL_DECL instance_draktharon_keep : public ScriptedInstance
{
    public:
        instance_draktharon_keep(Map* pMap);
        ~instance_draktharon_keep() {}

        void Initialize();

        void SetData(uint32 uiType, uint32 uiData);
        uint32 GetData(uint32 uiType);
        uint64 GetData64(uint32 uiType);

        void OnCreatureCreate(Creature* pCreature);
        void OnObjectCreate(GameObject* pGo);

        void OnCreatureEnterCombat(Creature* pCreature);
        void OnCreatureEvade(Creature* pCreature);
        void OnCreatureDeath(Creature* pCreature);

        bool CheckAchievementCriteriaMeet(uint32 uiCriteriaId, Player const* pSource, Unit const* pTarget, uint32 uiMiscValue1 /* = 0*/);

        const char* Save() { return strInstData.c_str(); }
        void Load(const char* chrIn);
        void ManageCrystals(uint32 action);

    protected:
        uint32 m_auiEncounter[MAX_ENCOUNTER];
        uint64 m_auiRitualCrystalGUID[CRYSTAL_NUMBER];
        std::string strInstData;

        uint32 m_uiDreadAddsKilled;
        bool m_bTrollgoreConsume;
        // Novos the Summoner
        uint64 m_uiNovosGUID;
        uint64 m_uiNovosChannelTargetGUID;
        bool m_bNovosAddGrounded;
};

#endif
