@ECHO OFF
TITLE Save, Load, Order and initialization Program (SLOP)
REM Save, Load, Order and initialization Program v1.0 231201 - For Build 2 "Bottle o' Features"

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
ECHO %weapon_type%
ECHO %player_name%
ECHO %player_class%
ECHO %player_damage%
ECHO %armor_equip%
ECHO %stamina_equip%
ECHO %damage_skill%
ECHO %stamina_skill%
ECHO %magicka_skill%
ECHO %player_affinity_blacksmith%
ECHO %player_affinity_armorer%
ECHO %player_affinity_wizard%
ECHO %defeat_bandit_achievement%
ECHO %defeat_jester_achievement%
ECHO %defeat_gnome_achievement%
ECHO %defeat_hunter_achievement%
ECHO %AFFC1_B%
ECHO %wpn_e%
ECHO %shd_e%
ECHO %amr_e%
ECHO %LC%
ECHO %CPD%
ECHO %C1P1NM%
ECHO %C1P1SM%
ECHO %C1P1EM%
ECHO %C1P1WM%
ECHO %C2P1NM%
ECHO %C2P1SM%
ECHO %C2P1EM%
ECHO %C2P1WM%
ECHO %LL%
ECHO %PM1name%
ECHO %PM2name%
ECHO %PM3name%
ECHO %PM1HP%
ECHO %PM2HP%
ECHO %PM3HP%
ECHO %PM1ATK%
ECHO %PM2ATK%
ECHO %PM3ATK%
ECHO %PM1OC%
ECHO %PM2OC%
ECHO %PM3OC%
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
ECHO %bronze_buckler_q%
ECHO %kite_shield_q%
)>"%cd%\data\player\inventory\Tools.txt"
GOTO :PLAYER_SAVE_GENERAL_ITEMS

REM Save the Player's general item data.
:PLAYER_SAVE_GENERAL_ITEMS
(
ECHO %healingT_q%
ECHO %staminaT_q%
ECHO %magickaT_q%
ECHO %stunT_q%
ECHO %travelers_journal_r%
ECHO %merchants_guide_r%
ECHO %guide_to_blades_r%
)>"%cd%\data\player\inventory\General Items.txt"
GOTO :BLACKSMITH_SAVE_INVENTORY

REM Saves the Blacksmith's inventory data.
:BLACKSMITH_SAVE_INVENTORY
(
ECHO %longswordB_q%
ECHO %shortswordB_q%
ECHO %greataxeB_q%
ECHO %maceB_q%
ECHO %woodenbbl_q%
ECHO %cactusB_q%
ECHO %stoneB_q%
ECHO %steelB_q%
ECHO %scaledB_q%
ECHO %longswordB_b%
ECHO %shortswordB_b%
ECHO %greataxeB_b%
ECHO %maceB_b%
ECHO %woodenb_b%
ECHO %cactusB_q%
ECHO %stoneB_q%
ECHO %steelB_q%
ECHO %scaledB_q%
ECHO %longswordB_price%
ECHO %shortswordB_price%
ECHO %greataxeB_price%
ECHO %maceB_price%
ECHO %woodenbb_price%
ECHO %cactusB_price%
ECHO %stoneB_price%
ECHO %steelB_price%
ECHO %scaledB_price%
)>"%cd%\data\Exploration Engine\Cells\Rockwinn Plaza\NPCs\NPC Data\Blacksmith Items.txt
GOTO :LOREKEEPER_SAVE_INVENTORY

REM Final saving stage.
:LOREKEEPER_SAVE_INVENTORY
(
ECHO %travelers_journal_price%
ECHO %merchants_guide_price%
ECHO %guide_to_blades_price%
ECHO %travelers_journalA1_price%
ECHO %merchants_guideA1_price%
ECHO %guide_to_bladesA1_price%
ECHO %travelers_journalL_q%
ECHO %merchants_guideL_q%
ECHO %guide_to_bladesL_q%
)>"%cd%\data\Exploration Engine\Cells\Windhelm High Quarter\NPCs\NPC Data\Lorekeeper Items.txt
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
SET /P weapon_type=
SET /P player_name=
SET /P player_class=
SET /P player_damage=
SET /P armor_equip=
SET /P stamina_equip=
SET /P damage_skill=
SET /P stamina_skill=
SET /P magicka_skill=
SET /P player_affinity_blacksmith=
SET /P player_affinity_armorer=
SET /P player_affinity_wizard=
SET /P defeat_bandit_achievement=
SET /P defeat_jester_achievement=
SET /P defeat_gnome_achievement=
SET /P defeat_hunter_achievement=
SET /P AFFC1_B=
SET /P wpn_e=
SET /P shd_e=
SET /P amr_e=
SET /P LC=
SET /P CPD=
SET /P C1P1NM=
SET /P C1P1SM=
SET /P C1P1EM=
SET /P C1P1WM=
SET /P C2P1NM=
SET /P C2P1SM=
SET /P C2P1EM=
SET /P C2P1WM=
SET /P LL=
SET /P PM1name=
SET /P PM2name=
SET /P PM3name=
SET /P PM1HP=
SET /P PM2HP=
SET /P PM3HP=
SET /P PM1ATK=
SET /P PM2ATK=
SET /P PM3ATK=
SET /P PM1OC=
SET /P PM2OC=
SET /P PM3OC=
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
SET /P longsword_price=
SET /P shortsword_price=
SET /P greataxe_price=
SET /P mace_price=
SET /P woodenb_price=
SET /P cactusA_price=
SET /P stoneA_price=
SET /P steelA_price=
SET /P scaledA_price=
SET /P healingT_price=
SET /P staminaT_price=
SET /P magickaT_price=
SET /P longswordA1_price=
SET /P shortswordA1_price=
SET /P greataxeA1_price=
SET /P maceA1_price=
SET /P woodenbA1_price=
SET /P cactusAA1_price=
SET /P stoneAA1_price=
SET /P steelAA1_price=
SET /P scaledAA1_price=
SET /P longswordB_q=
SET /P shortswordB_q=
SET /P greataxeB_q=
SET /P maceB_q=
SET /P woodenb_q=
SET /P cactusB_q=
SET /P stoneB_q=
SET /P steelB_q=
SET /P scaledB_q=
SET /P longswordB_b=
SET /P shortswordB_b=
SET /P greataxeB_b=
SET /P maceB_b=
SET /P woodenbbl_q=
SET /P cactusB_q=
SET /P stoneB_q=
SET /P steelB_q=
SET /P scaledB_q=
SET /P longswordB_price=
SET /P shortswordB_price=
SET /P greataxeB_price=
SET /P maceB_price=
SET /P woodenbb_price=
SET /P cactusB_price=
SET /P stoneB_price=
SET /P steelB_price=
SET /P scaledB_price=
)<"%cd%\data\Exploration Engine\Cells\Rockwinn Plaza\NPCs\NPC Data\Blacksmith Items.txt
GOTO :ARMORER_LOAD_INVENTORY

REM AS OF 11/27 the Armorer doesn't use an inventory, still waiting to add it.
REM Load the Armorer's inventory.
:ARMORER_LOAD_INVENTORY
GOTO :LOREKEEPER_LOAD_INVENTORY

REM Windhelm High Quarter loading.
REM Load the Lorekeeper's inventory.
:LOREKEEPER_LOAD_INVENTORY
(
SET /P travelers_journal_price=
SET /P merchants_guide_price=
SET /P guide_to_blades_price=
SET /P travelers_journalA1_price=
SET /P merchants_guideA1_price=
SET /P guide_to_bladesA1_price=
SET /P travelers_journalL_q=
SET /P merchants_guideL_q=
SET /P guide_to_bladesL_q=
)<"%cd%\data\Exploration Engine\Cells\Windhelm High Quarter\NPCs\NPC Data\Lorekeeper Items.txt
GOTO :WIZARD_LOAD_INVENTORY

REM AS OF 11/27 the Wizard doesn't use an inventory, still waiting to add it.
REM Final loading stage. Load the Wizard's inventory.
:WIZARD_LOAD_INVENTORY
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
SET weapon_type=Melee
REM Used to modify the stamina level when equipping armor and such.
SET maxStam=100
SET player_damage=5
REM Functions exactly like the old EAV variable, it's just the armor value.
SET armor_equip=0
REM Functions like the armor variable, but for Stamina. When I have "equipped" items implemented better in the future, probably wont need this variable, but for now it is needed.
SET stamina_equip=0
SET damage_skill=2
SET stamina_skill=2
SET magicka_skill=2
REM Player affinity
SET player_affinity_blacksmith=200
SET player_affinity_armorer=200
SET player_affinity_wizard=200
REM Player achievements
SET defeat_bandit_achievement=0
SET defeat_jester_achievement=0
SET defeat_gnome_achievement=0
SET defeat_hunter_achievement=0
REM Affinity Check
SET AFFC1_B=0
REM Player positions
REM "LC" is for "Last Chunk" positions.
REM "CPD" is for the direction the player when in said chunk.
SET LC=1
SET CPD=1
REM Chunk movement stores.
SET C1P1NM=3
SET C1P1SM=3
SET C1P1EM=3
SET C1P1WM=3
SET C2P1NM=3
SET C2P1SM=3
SET C2P1EM=3
SET C2P1WM=3
REM Player Location
SET LL=WP
REM Set default Party information.
SET PM1name=VACANT
SET PM2name=VACANT
SET PM3name=VACANT
SET PM1HP=0
SET PM2HP=0
SET PM3HP=0
SET PM1ATK=0
SET PM2ATK=0
SET PM3ATK=0
REM The associated party member's "occupation".
SET PM1OC=NONE
SET PM2OC=NONE
SET PM3OC=NONE
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
REM Has the scroll/book been read?
SET travelers_journal_r=0
SET merchants_guide_r=0
SET guide_to_blades_r=0
GOTO :INIT_MERCHANTS

:INIT_MERCHANTS
REM Setup Merchant inventories & Prices
REM BLACKSMITH ITEM PRICES
SET longsword_price=220
SET shortsword_price=190
SET greataxe_price=700
SET mace_price=283
SET woodenb_price=122
SET cactusA_price=200
SET stoneA_price=300
SET steelA_price=900
SET scaledA_price=1400
SET healingT_price=0
SET staminaT_price=0
SET magickaT_price=0
REM BLACKSMITH LEVEL 1 AFFINITY PRICES
SET longswordA1_price=180
SET shortswordA1_price=150
SET greataxeA1_price=400
SET maceA1_price=210
SET woodenbA1_price=80
SET cactusAA1_price=100
SET stoneAA1_price=200
SET steelAA1_price=500
SET scaledAA1_price=1000
REM BLACKSMITH ITEM COUNTS
SET longswordB_q=20
SET shortswordB_q=20
SET greataxeB_q=20
SET maceB_q=20
SET woodenbbl_q=20
SET cactusB_q=10
SET stoneB_q=20
SET steelB_q=4
SET scaledB_q=1
REM BLACKSMITH ACCEPTING ITEM?
SET longswordB_b=0
SET shortswordB_b=0
SET greataxeB_b=0
SET maceB_b=0
SET woodenb_b=0
SET cactusB_b=0
SET stoneB_b=0
SET steelB_b=0
SET scaledB_b=0
REM BLACKSMITH SELL (BUYING) PRICES
SET longswordB_price=1
SET shortswordB_price=1
SET greataxeB_price=1
SET maceB_price=1
SET woodenbb_price=1
SET cactusB_price=1
SET stoneB_price=1
SET steelB_price=1
SET scaledB_price=1
REM LOREKEEPER ITEM PRICES
SET travelers_journal_price=80
SET merchants_guide_price=400
SET guide_to_blades_price=700
REM LOREKEEPER LEVEL 1 AFFINITY PRICES
SET travelers_journalA1_price=40
SET merchants_guideA1_price=345
SET guide_to_bladesA1_price=625
REM LOREKEEPER ITEM COUNT
SET travelers_journalL_q=1
SET merchants_guideL_q=20
SET guide_to_bladesL_q=5
GOTO :saveData