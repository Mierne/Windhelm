@ECHO OFF
TITLE Save, Load Order and initialization Program (SLoP)
REM Save, Load, Order and initialization Program v1.0 231222 - For Build 2 "Bottle o' Features"

REM Hardcoded, unchanging variables such as Armor Protection value.
:HCV
SET cactusA_p=3
SET guardA_p=5
SET stoneA_p=7
SET steelA_p=9
SET scaledA_p=15
SET ironArmor_prot=8
SET leatherArmor_prot=4
SET silverArmor_prot=10
SET goldArmor_prot=12
GOTO :callCheck

REM Check for the given reason this script was called
:callCheck
IF %SLOPr% == SAVE (
    GOTO :saveData
) ELSE IF %SLOPr% == LOAD (
    GOTO :loadData
) ELSE IF %SLOPr% == INIT (
    GOTO :PLAYER_INIT_STATS
) ELSE (
    SET errorType=checkTime
    CALL "%cd%\data\functions\errorhandling.bat"
    EXIT /B
)

REM Saves Player & Merchant data.
:saveData
(
ECHO %HP%
ECHO %STAMINA%
ECHO %MAGICKA%
ECHO %COINS%
ECHO %LEVELS%
ECHO %MAGICKAMAX%
ECHO %STAMINAMAX%
ECHO %HPMAX%
ECHO %player_action_p%
ECHO %weapon_type%
ECHO %player_effect_1%
ECHO %player_effect_2%
ECHO %player_name%
ECHO %player_class%
ECHO %maxStam%
ECHO %player_damage%
ECHO %armor_equip%
ECHO %stamina_equip%
ECHO %actionpoint_equip%
ECHO %damage_skill%
ECHO %stamina_skill%
ECHO %magicka_skill%
ECHO %speech_skill%
ECHO %player_affinity_alchemist%
ECHO %player_affinity_armorer%
ECHO %player_affinity_blacksmith%
ECHO %player_affinity_armorer%
ECHO %player_affinity_wizard%
ECHO %defeat_bandit_achievement%
ECHO %defeat_jester_achievement%
ECHO %defeat_gnome_achievement%
ECHO %defeat_hunter_achievement%
ECHO %AFFC1_B%
ECHO %AFFC1_AL%
ECHO %AFFC1_AR%
ECHO %AFFC1_W%
ECHO %wpn_e%
ECHO %shd_e%
ECHO %amr_e%
ECHO %LL%
ECHO %PM1name%
ECHO %PM2name%
ECHO %PM3name%
ECHO %PM1HP%
ECHO %PM2HP%
ECHO %PM3HP%
ECHO %PM1DS%
ECHO %PM1SS%
ECHO %PM1MS%
ECHO %PM2DS%
ECHO %PM2SS%
ECHO %PM2MS%
ECHO %PM3DS%
ECHO %PM3SS%
ECHO %PM3MS%
ECHO %PM1ATK%
ECHO %PM2ATK%
ECHO %PM3ATK%
ECHO %PM1OC%
ECHO %PM2OC%
ECHO %PM3OC%
ECHO %PM1STM%
ECHO %PM2STM%
ECHO %PM3STM%
ECHO %PM1MGK%
ECHO %PM2MGK%
ECHO %PM3MGK%
ECHO %PARTY_SLOT_1%
ECHO %PARTY_SLOT_2%
ECHO %PARTY_SLOT_3%
ECHO %CBWencountered%
ECHO %GBAencountered%
ECHO %GRMencountered%
ECHO %personal_p_1%
ECHO %personal_p_2%
ECHO %possesive_1%
ECHO %reflexive_1%
ECHO %intensive_1%
)>"%cd%\data\player\Player Stats.txt"
GOTO :PLAYER_SAVE_TOOLS

REM Save the Player's tool data.
:PLAYER_SAVE_TOOLS
(
ECHO %longsword_q%
ECHO %shortsword_q%
ECHO %greataxe_q%
ECHO %mace_q%
ECHO %cactusA_q%
ECHO %stoneA_q%
ECHO %steelA_q%
ECHO %scaledA_q%
ECHO %guardA_q%
ECHO %bRobes_q%
ECHO %iRobes_q%
ECHO %aRobes_q%
ECHO %bronze_buckler_q%
ECHO %kite_shield_q%
)>"%cd%\data\player\inventory\Tools.txt"
GOTO :BLACKSMITH_SAVE_DATA

REM SAVING MERCHANT DATA - BLACKSMITH
:BLACKSMITH_SAVE_DATA
(
ECHO %lSword_p%
ECHO %sSword_p%
ECHO %gAxe_p%
ECHO %mace_p%
ECHO %wBow_p%
ECHO %lSword_affinityleveltwo_d%
ECHO %sSword_affinityleveltwo_d%
ECHO %gAxe_affinityleveltwo_d%
ECHO %mace_affinityleveltwo_d%
ECHO %wBow_affinityleveltwo_d%
ECHO %lSword_s%
ECHO %sSword_s%
ECHO %gAxe_s%
ECHO %mace_s%
ECHO %wBow_s%
)>"%cd%\data\Exploration Engine\Cells\Rockwinn Plaza\NPCs\NPC Data\Blacksmith.txt
GOTO :WIZARD_SAVE_DATA

REM SAVING MERCHANT DATA - WIZARD
:WIZARD_SAVE_DATA
(
ECHO %bRobes_p%
ECHO %iRobes_p%
ECHO %aRobes_p%
ECHO %bRobes_affinityleveltwo_d%
ECHO %iRobes_affinityleveltwo_d%
ECHO %aRobes_affinityleveltwo_d%
ECHO %bRobes_s%
ECHO %iRobes_s%
ECHO %aRobes_s%
)>"%cd%\data\Exploration Engine\Cells\Windhelm High Quarter\NPCs\NPC Data\Wizard.txt"

GOTO :LOREKEEPER_SAVE_DATA

REM SAVING MERCHANT DATA - LOREKEEPER
:LOREKEEPER_SAVE_DATA
(
ECHO %tJournal_p%
ECHO %mGuide_p%
ECHO %gBlades_p%
ECHO %tJournal_affinityleveltwo_d%
ECHO %mGuide_affinityleveltwo_d%
ECHO %gBlades_affinityleveltwo_d%
ECHO %tJournal_s%
ECHO %mGuide_s%
ECHO %gBlades_s%
)>"%cd%\data\Exploration Engine\Cells\Windhelm High Quarter\NPCs\NPC Data\Lorekeeper.txt
GOTO :ALCHEMIST_SAVE_DATA

REM FINAL SAVE STATGE - ALCHEMIST
:ALCHEMIST_SAVE_DATA
(
ECHO %hTonic_p%
ECHO %sTonic_p%
ECHO %mTonic_p%
ECHO %hTonic_affinityleveltwo_d%
ECHO %sTonic_affinityleveltwo_d%
ECHO %mTonic_affinityleveltwo_d%
ECHO %hTonic_affinitylevelthree_d%
ECHO %sTonic_affinitylevelthree_d%
ECHO %mTonic_affinitylevelthree_d%
ECHO %hTonic_s%
ECHO %sTonic_s%
ECHO %mTonic_s%
)>"%cd%\data\Exploration Engine\Cells\Rockwinn Plaza\NPCs\NPC Data\Alchemist.txt"
GOTO :EOF

REM Loads Player stats.
:loadData
(
SET /P HP=
SET /P STAMINA=
SET /P MAGICKA=
SET /P COINS=
SET /P LEVELS=
SET /P MAGICKAMAX=
SET /P STAMINAMAX=
SET /P HPMAX=
SET /P player_action_p=
SET /P weapon_type=
SET /P player_effect_1=
SET /P player_effect_2=
SET /P player_name=
SET /P player_class=
SET /P maxStam=
SET /P player_damage=
SET /P armor_equip=
SET /P stamina_equip=
SET /P actionpoint_equip=
SET /P damage_skill=
SET /P stamina_skill=
SET /P magicka_skill=
SET /P speech_skill=
SET /P player_affinity_alchemist=
SET /P player_affinity_armorer=
SET /P player_affinity_blacksmith=
SET /P player_affinity_armorer=
SET /P player_affinity_wizard=
SET /P defeat_bandit_achievement=
SET /P defeat_jester_achievement=
SET /P defeat_gnome_achievement=
SET /P defeat_hunter_achievement=
SET /P AFFC1_B=
SET /P AFFC1_AL=
SET /P AFFC1_AR=
SET /P AFFC1_W=
SET /P wpn_e=
SET /P shd_e=
SET /P amr_e=
SET /P LL=
SET /P PM1name=
SET /P PM2name=
SET /P PM3name=
SET /P PM1HP=
SET /P PM2HP=
SET /P PM3HP=
SET /P PM1DS=
SET /P PM1SS=
SET /P PM1MS=
SET /P PM2DS=
SET /P PM2SS=
SET /P PM2MS=
SET /P PM3DS=
SET /P PM3SS=
SET /P PM3MS=
SET /P PM1ATK=
SET /P PM2ATK=
SET /P PM3ATK=
SET /P PM1OC=
SET /P PM2OC=
SET /P PM3OC=
SET /P PM1STM=
SET /P PM2STM=
SET /P PM3STM=
SET /P PM1MGK=
SET /P PM2MGK=
SET /P PM3MGK=
SET /P PARTY_SLOT_1=
SET /P PARTY_SLOT_2=
SET /P PARTY_SLOT_3=
SET /P CBWencountered=
SET /P GBAencountered=
SET /P GRMencountered=
SET /P personal_p_1=
SET /P personal_p_2=
SET /P possesive_1=
SET /P reflexive_1=
SET /P intensive_1=
)<"%cd%\data\player\Player Stats.txt"
GOTO :PLAYER_LOAD_TOOLS

REM Load the Player's tool data.
:PLAYER_LOAD_TOOLS
(
SET /P longsword_q=
SET /P shortsword_q=
SET /P greataxe_q=
SET /P mace_q=
SET /P woodenb_q=
SET /P cactusA_q=
SET /P stoneA_q=
SET /P steelA_q=
SET /P scaledA_q=
SET /P guardA_q=
SET /P bRobes_q=
SET /P iRobes_q=
SET /P aRobes_q=
SET /P bronze_buckler_q=
SET /P kite_shield_q=
)<"%cd%\data\player\inventory\Tools.txt"
GOTO :PLAYER_LOAD_GENERAL_ITEMS

REM Load the Player's general item data.
:PLAYER_LOAD_GENERAL_ITEMS
(
SET /P healingT_q=
SET /P staminaT_q=
SET /P magickaT_q=
SET /P stunT_q=
SET /P travelers_journal_q=
SET /P merchants_guide_q=
SET /P guide_to_blades_q=
SET /P travelers_journal_r=
SET /P merchants_guide_r=
SET /P guide_to_blades_r=
)<"%cd%\data\player\inventory\General Items.txt"
GOTO :BLACKSMITH_LOAD_INVENTORY

REM Rockwinn Plaza NPC loading.
REM Loads the Blacksmith's inventory data.
:BLACKSMITH_LOAD_INVENTORY
(
SET /P lSword_p=
SET /P sSword_p=
SET /P gAxe_p=
SET /P mace_p=
SET /P wBow_p=
SET /P lSword_affinityleveltwo_d=
SET /P sSword_affinityleveltwo_d=
SET /P gAxe_affinityleveltwo_d=
SET /P mace_affinityleveltwo_d=
SET /P wBow_affinityleveltwo_d=
SET /P lSword_s=
SET /P sSword_s=
SET /P gAxe_s=
SET /P mace_s=
SET /P wBow_s=
)<"%cd%\data\Exploration Engine\Cells\Rockwinn Plaza\NPCs\NPC Data\Blacksmith.txt
GOTO :ARMORER_LOAD_DATA

REM LOAD MERCHANT DATA - ARMORER
:ARMORER_LOAD_DATA
(
SET /P cactusArmor_p=
SET /P stoneArmor_p=
SET /P steelArmor_p=
SET /P scaledArmor_p=
SET /P ironArmor_p=
SET /P leatherArmor_p=
SET /P silverArmor_p=
SET /P goldArmor_p=
SET /P cactusArmor_affinityleveltwo_d=
SET /P stoneArmor_affinityleveltwo_d=
SET /P steelArmor_affinityleveltwo_d=
SET /P scaledArmor_affinityleveltwo_d=
SET /P ironArmor_affinityleveltwo_d=
SET /P leatherArmor_affinityleveltwo_d=
SET /P silverArmor_affinityleveltwo_d=
SET /P goldArmor_affinityleveltwo_d=
SET /P cactusArmor_s=
SET /P stoneArmor_s=
SET /P steelArmor_s=
SET /P scaledArmor_s=
SET /P ironArmor_ps=
SET /P leatherArmor_s=
SET /P silverArmor_s=
SET /P goldArmor_s=
)<"%cd%\data\Exploration Engine\Rockwinn Plaza\NPCs\NPC Data\Armorer.txt"
GOTO :LOREKEEPER_LOAD_DATA

REM LOAD MERCHANT DATA - LOREKEEPER
:LOREKEEPER_LOAD_DATA
(
SET /P tJournal_p=
SET /P mGuide_p=
SET /P gBlades_p=
SET /P tJournal_affinityleveltwo_d=
SET /P mGuide_affinityleveltwo_d=
SET /P gBlades_affinityleveltwo_d=
SET /P tJournal_s=
SET /P mGuide_s=
SET /P gBlades_s=
)<"%cd%\data\Exploration Engine\Cells\Windhelm High Quarter\NPCs\NPC Data\Lorekeeper.txt
GOTO :WIZARD_LOAD_DATA

REM LOAD MERCHANT DATA - WIZARD
:WIZARD_LOAD_DATA
(
SET /P bRobes_p=
SET /P iRobes_p=
SET /P aRobes_p=
SET /P bRobes_affinityleveltwo_d=
SET /P iRobes_affinityleveltwo_d=
SET /P aRobes_affinityleveltwo_d=
SET /P bRobes_s=
SET /P iRobes_s=
SET /P aRobes_s=
)<"%cd%\data\Exploration Engine\Cells\Windhelm Higher Quarter\NPCs\NPC Data\Wizard.txt"
GOTO :ALCHEMIST_LOAD_DATA

REM LOAD MERCHANT DATA - ALCHEMIST
:ALCHEMIST_LOAD_DATA
(
SET /P hTonic_p=
SET /P sTonic_p=
SET /P mTonic_p=
SET /P hTonic_affinityleveltwo_d=
SET /P sTonic_affinityleveltwo_d=
SET /P mTonic_affinityleveltwo_d=
SET /P hTonic_affinitylevelthree_d=
SET /P sTonic_affinitylevelthree_d=
SET /P mTonic_affinitylevelthree_d=
SET /P hTonic_s=
SET /P sTonic_s=
SET /P mTonic_s=
)<"%cd%\data\Exploration Engine\Cells\Rockwinn Plaza\NPCs\NPC Data\Alchemist.txt"
GOTO :EOF

REM Runs when a new game is started to generate needed variables.
:PLAYER_INIT_STATS
SET HP=100
SET STAMINA=100
SET MAGICKA=100
SET COINS=0
SET LEVELS=0
SET MAGICKAMAX=100
SET STAMINAMAX=100
SET HPMAX=100
SET player_action_p=20
SET weapon_type=Melee
SET player_effect_1=None
SET player_effect_2=None
REM Used to modify the stamina level when equipping armor and such.
SET maxStam=100
SET player_damage=5
REM Functions exactly like the old EAV variable, it's just the armor value.
SET armor_equip=0
REM Functions like the armor variable, but for Stamina. When I have "equipped" items implemented better in the future, probably wont need this variable, but for now it is needed.
SET stamina_equip=0
SET actionpoint_equip=0
SET damage_skill=2
SET stamina_skill=2
SET magicka_skill=2
SET speech_skill=2
REM Player affinity. Level 1: 200, Level 2: 400, Level 3: 600, Level 4: 1000, Level 5 (MAX): 2000
SET player_affinity_alchemist=200
SET player_affinity_armorer=200
SET player_affinity_blacksmith=200
SET player_affinity_wizard=200
REM Player achievements
SET defeat_bandit_achievement=0
SET defeat_jester_achievement=0
SET defeat_gnome_achievement=0
SET defeat_hunter_achievement=0
REM Affinity Check
SET AFFC1_B=0
SET AFFC1_AL=0
SET AFFC1_AR=0
SET AFFC1_W=0
REM Player positions
SET LL=WP
REM Set default Party information.
SET PM1name=VACANT
SET PM2name=VACANT
SET PM3name=VACANT
SET PM1HP=0
SET PM2HP=0
SET PM3HP=0
REM Party member skill levels, currently only supports damage, stamina and magicka.
SET PM1DS=0
SET PM1SS=0
SET PM1MS=0
SET PM2DS=0
SET PM2SS=0
SET PM2MS=0
SET PM3DS=0
SET PM3SS=0
SET PM3MS=0
SET PM1ATK=0
SET PM2ATK=0
SET PM3ATK=0
SET PM1STM=0
SET PM2STM=0
SET PM3STM=0
SET PM1MGK=0
SET PM2MGK=0
SET PM3MGK=0
SET PARTY_SLOT_1=0
SET PARTY_SLOT_2=0
SET PARTY_SLOT_3=0
REM The associated party member's "occupation".
SET PM1OC=NONE
SET PM2OC=NONE
SET PM3OC=NONE
REM Prevent encountering rare NPCs repeatedly.
SET CBWencountered=0
SET GBAencountered=0
SET GRMencountered=0
GOTO :PLAYER_INIT_INVENTORY

REM Creates empty inventory slots
:PLAYER_INIT_INVENTORY
REM Create weapons owned values.
SET longsword_q=0
SET shortsword_q=0
SET greataxe_q=0
SET mace_q=0
REM Create armor owned values.
SET cactusA_q=0
SET stoneA_q=0
SET steelA_q=0
SET scaledA_q=0
SET guardA_q=0
SET bRobes_q=0
SET iRobes_q=0
SET aRobes_q=0
REM Create shields owned values.
SET bronze_buckler_q=0
SET kite_shield_q=0
REM Create Tonics owned values.
SET healingT_q=0
SET staminaT_q=0
SET magickaT_q=0
SET stunT_q=0
REM Equip slots
SET wpn_e=EMPTY
SET shd_e=EMPTY
SET amr_e=EMPTY
REM GENERAL INVENTORY ITEMS, SUCH AS BOOKS & SCROLLS.
SET travelers_journal_q=0
SET merchants_guide_q=0
SET guide_to_blades_q=0
REM Has the skill scroll/book been read?
SET travelers_journal_r=0
SET merchants_guide_r=0
SET guide_to_blades_r=0
GOTO :INIT_MERCHANTS

REM Setup Merchant inventories & Prices
:INIT_MERCHANTS
REM Blacksmith Shop Base Prices.
SET lSword_p=220
SET sSword_p=190
SET gAxe_p=700
SET mace_p=283
SET wBow_p=122
REM Blacksmith Shop Affinity level Two Discounts.
SET lSword_affinityleveltwo_d=25
SET sSword_affinityleveltwo_d=25
SET gAxe_affinityleveltwo_d=25
SET mace_affinityleveltwo_d=25
SET wBow_affinityleveltwo_d=25
REM Blacksmith Sellback Prices.
SET lSword_p=190
SET sSword_p=140
SET gAxe_p=500
SET mace_p=215
SET wBow_p=80
REM Blacksmith Shop Stock.
SET lSword_s=6
SET sSword_s=4
SET gAxe_s=5
SET mace_s=5
SET wBow_s=2
REM Lorekeeper Shop Base Prices.
SET tJournal_p=80
SET mGuide_p=400
SET gBlades_p=700
REM Lorekeeper Shop Affinity Level Two Discounts.
SET tJournal_affinityleveltwo_d=10
SET mGuide_affinityleveltwo_d=40
SET gBlades_affinityleveltwo_d=90
REM Lorekeeper Shop Item Stock.
SET tJournal_s=1
SET mGuide_s=5
SET gBlades_s=2
REM Alchemist Shop Base Prices.
SET hTonic_p=25
SET sTonic_p=25
SET mTonic_p=25
REM Alchemist Shop Affinity Level Two Discouts.
SET hTonic_affinityleveltwo_d=5
SET sTonic_affinityleveltwo_d=5
SET mTonic_affinityleveltwo_d=5
REM Alchemist Shop Affinity Level Three Discouts.
SET hTonic_affinitylevelthree_d=10
SET sTonic_affinitylevelthree_d=10
SET mTonic_affinitylevelthree_d=10
REM Alchemist Item Stock.
SET hTonic_s=50
SET sTonic_s=50
SET mTonic_s=50
REM Wizard Shop Base Prices.
SET bRobes_p=500
SET iRobes_p=1200
SET aRobes_p=5000
REM Wizard Shop Affinity Level Two Discounts.
SET bRobes_affinityleveltwo_d=40
SET iRobes_affinityleveltwo_d=100
SET aRobes_affinityleveltwo_d=200
REM Wizard Shop Item Stock.
SET bRobes_s=10
SET iRobes_s=5
SET aRobes_s=1
REM Armorer Shop Base Prices.
SET cactusArmor_p=100
SET stoneArmor_p=200
SET steelArmor_p=500
SET scaledArmor_p=1200
SET ironArmor_p=250
SET leatherArmor_p=80
SET silverArmor_p=800
SET goldArmor_p=850
REM Armorer Shop Affinity Level Two Discounts.
SET cactusArmor_affinityleveltwo_d=20
SET stoneArmor_affinityleveltwo_d=20
SET steelArmor_affinityleveltwo_d=20
SET scaledArmor_affinityleveltwo_d=20
SET ironArmor_affinityleveltwo_d=20
SET leatherArmor_affinityleveltwo_d=20
SET silverArmor_affinityleveltwo_d=20
SET goldArmor_affinityleveltwo_d=20
REM Armorer Shop Item Stock.
SET cactusArmor_s=10
SET stoneArmor_s=10
SET steelArmor_s=10
SET scaledArmor_s=4
SET ironArmor_s=10
SET leatherArmor_s=10
SET silverArmor_s=5
SET goldArmor_s=6
GOTO :saveData