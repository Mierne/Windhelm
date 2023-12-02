@ECHO OFF
REM Inventory System v2.2 (231104) - For Windhelm v1.2b "Kōritsu"

REM Dashboard
:dash
CLS
ECHO.
TYPE "%cd%\data\ascii\menus\INVENTORY.txt"
ECHO.
ECHO                               Equip owned items and view Tonics.
ECHO.
ECHO LEVELS: %levels% ^| COINS: %coins% ^| ARMOR: %armor_equip%
ECHO WEAPON: %wpn_e% ^| SHIELD: %shd_e% ^| ARMOR %amr_e%
ECHO %displayMessage%
ECHO ========================================================================================================================
ECHO [1] SWORDS ^| [2] AXES ^| [3] MACES ^| [4] TONICS ^| [5] ARMOR ^| [6] Shields ^| [7] BOOKS AND SCROLLS ^| [E] EXIT
CHOICE /C 1234567E /N /M ">"
IF ERRORLEVEL 8 GOTO :EOF
IF ERRORLEVEL 7 GOTO :books
IF ERRORLEVEL 6 GOTO :shields
IF ERRORLEVEL 5 GOTO :armor
IF ERRORLEVEL 4 GOTO :tonics
IF ERRORLEVEL 3 GOTO :maces
IF ERRORLEVEL 2 GOTO :Axes
IF ERRORLEVEL 1 GOTO :swords

REM Swords
:swords
SET curMenu=swords
CLS
ECHO.
TYPE "%cd%\data\ascii\menus\INVENTORY.txt"
ECHO.
ECHO                                     Equip owned swords.
ECHO.
ECHO LEVELS: %levels% ^| COINS: %coins% ^| ARMOR: %armor_equip%
ECHO %displayMessage%
ECHO ========================================================================================================================
ECHO [1] LONGSWORD (%longsword_q%) ^| [2] SHORTSWORD (%shortsword_q%) ^| [E] EXIT
CHOICE /C 12E /N /M ">"
IF ERRORLEVEL 3 GOTO :dash
IF ERRORLEVEL 2 GOTO :equipShortsword
IF ERRORLEVEL 1 GOTO :equipLongsword

:equipLongsword
IF %longsword_q% EQU 0 (
    GOTO :no_item
) ELSE (
    IF NOT %wpn_e% == EMPTY (
        SET wpn_e=EMPTY
        SET player_damage=5
        SET displayMessage=Unequipped Longsword.
        GOTO :swords
    ) ELSE (
        SET wpn_e=LongSword
        SET player_damage=%longsword_d%
        SET displayMessage=Equipped Longsword.
        GOTO :swords
    )
)

:equipShortsword
IF %shortsword_q% EQU 0 (
    GOTO :no_item
) ELSE (
    IF NOT %wpn_e% == EMPTY (
        SET wpn_e=EMPTY
        SET player_damage=5
        SET displayMessage=Unequipped Shortsword.
        GOTO :swords
    ) ELSE (
        SET wpn_e=ShortSword
        SET player_damage=%shortsword_d%
        SET displayMessage=Equipped Shortsword.
    )
)

REM Axes
:axes
SET curMenu=axes
CLS
ECHO.
TYPE "%cd%\data\ascii\menus\INVENTORY.txt"
ECHO.
ECHO                                     Equip owned Axes.
ECHO.
ECHO LEVELS: %levels% ^| COINS: %coins% ^| ARMOR: %armor_equip%
ECHO %displayMessage%
ECHO ========================================================================================================================
ECHO [1] GREAT AXE (%greataxe_q%) ^| [E] EXIT
CHOICE /C 1E /N /M ">"
IF ERRORLEVEL 2 GOTO :dash
IF ERRORLEVEL 1 GOTO :equipGreatAxe

:equipGreatAxe
IF %greataxe_q% EQU 0 (
    GOTO :no_item
) ELSE (
    IF NOT %wpn_e% == EMPTY (
        SET wpn_e=EMPTY
        SET player_damage=5
        SET displayMessage=Unequipped Great Axe.
        GOTO :swords
    ) ELSE (
        SET wpn_e=GreatAxe
        SET player_damage=%greataxe_d%
        SET displayMessage=Equipped Greataxe. ATK is now %greataxe_d%.
        GOTO :axes
    )
)

REM Maces
:maces
SET curMenu=maces
CLS
ECHO.
TYPE "%cd%\data\ascii\menus\INVENTORY.txt"
ECHO.
ECHO                                     Equip owned Maces.
ECHO.
ECHO LEVELS: %levels% ^| COINS: %coins% ^| ARMOR: %armor_equip%
ECHO %displayMessage%
ECHO ========================================================================================================================
ECHO [1] MACE (%mace_q%) ^| [E] EXIT
CHOICE /C 1E /N /M ">"
IF ERRORLEVEL 2 GOTO :dash
IF ERRORLEVEL 1 GOTO :equipMace

:equipMace
IF %mace_q% EQU 0 (
    GOTO :no_item
) ELSE (
    IF NOT %wpn_e% == EMPTY (
        SET wpn_e=EMPTY
        SET player_damage=5
        SET displayMessage=Unequipped Mace.
        GOTO :swords
    ) ELSE (
        SET wpn_e=Mace
        SET player_damage=%mace_d%
        SET displayMessage=Equipped Mace.
        GOTO :maces
    )
)

REM Tonics
:tonics
SET curMenu=tonics
CLS
ECHO.
TYPE "%cd%\data\ascii\menus\INVENTORY.txt"
ECHO.
ECHO                                     View owned Tonics.
ECHO.
ECHO LEVELS: %levels% ^| COINS: %coins% ^| ARMOR: %EAV%
ECHO %displayMessage%
ECHO ========================================================================================================================
ECHO [X] HEALING TONIC (%healingT_q%) ^| [X] STAMINA TONIC (%staminaT_q%) ^| [X] MAGICKA TONIC (%magickaT_q%) ^| [E] EXIT
CHOICE /C E /N /M ">"
IF ERRORLEVEL 1 GOTO :dash

REM Armor
:armor
SET curMenu=armor
CLS
ECHO.
TYPE "%cd%\data\ascii\menus\INVENTORY.txt"
ECHO.
ECHO                                   Equip owned Armor sets.
ECHO.
ECHO LEVELS: %levels% ^| COINS: %coins% ^| ARMOR: %armor_equip%
ECHO %displayMessage%
ECHO ========================================================================================================================
ECHO [1] CACTUS ARMOR (%cactusA_q%) ^| [2] STONE ARMOR (%stoneA_q%) ^| [3] STEEL ARMOR (%steelA_q%) ^| [4] SCALED ARMOR (%scaledA_q%)
ECHO [5] GUARD ARMOR ^| [E] BACK
CHOICE /C 12345E /N /M ">"
IF ERRORLEVEL 6 GOTO :dash
IF ERRORLEVEL 5 GOTO :equipGuard
IF ERRORLEVEL 4 GOTO :equipScaled
IF ERRORLEVEL 3 GOTO :equipSteel
IF ERRORLEVEL 2 GOTO :equipStone
IF ERRORLEVEL 1 GOTO :equipCactus

REM Equip cactus armor.
:equipCactus
IF %cactusA_q% EQU 0 (
    GOTO :no_item
) ELSE (
    IF NOT %shd_e% == EMPTY (
        GOTO :shield_armor_conflict
    ) ELSE (
        IF NOT %amr_e% == EMPTY (
            SET amr_e=EMPTY
            SET armor_equip=0
            SET displayMessage=Unequipped Cactus Armor.
            GOTO :armor
        ) ELSE (
            SET amr_e=CactusArmor
            SET armor_equip=%cactusA_p%
            SET displayMessage=Equipped Cactus Armor. Max Stamina is now %stamina%
            SET maxStam=92
            SET stamina=%maxStam%
            GOTO :armor
        )
    )
)

REM Equip stone armor.
:equipStone
IF %stoneA_q% EQU 0 (
    GOTO :no_item
) ELSE (
    IF NOT %shd_e% == EMPTY (
        GOTO :shield_armor_conflict
    ) ELSE (
        IF NOT %amr_e% == EMPTY (
            SET amr_e=EMPTY
            SET armor_equip=0
            SET displayMessage=Unequipped Stone Armor.
            GOTO :armor
        ) ELSE (
            SET amr_e=StoneArmor
            SET armor_equip=%stoneA_p%
            SET displayMessage=Equipped Stone Armor.
            SET maxStam=88
            SET stamina=%maxStam%
            GOTO :armor
        )
    )
)

REM Equip steel armor.
:equipSteel
IF %steelA_q% EQU 0 (
    GOTO :no_item
) ELSE (
    IF NOT %shd_e% == EMPTY (
        GOTO :shield_armor_conflict
    ) ELSE (
        IF NOT %amr_e% == EMPTY (
            SET amr_e=EMPTY
            SET armor_equip=0
            SET displayMessage=Unequipped Steel Armor.
            GOTO :armor
        ) ELSE (
            SET amr_e=SteelArmor
            SET armor_equip=%steelA_p%
            SET displayMessage=Equipped Steel Armor.
            SET maxStam=84
            SET stamina=%maxStam%
            GOTO :armor
        )
    )
)
:equipScaled
IF %scaledA_q% EQU 0 (
    GOTO :no_item
) ELSE (
    IF NOT %shd_e% == EMPTY (
        GOTO :shield_armor_conflict
    ) ELSE (
        IF NOT %amr_e% == EMPTY (
            SET amr_e=EMPTY
            SET armor_equip=0
            SET displayMessage=Unequipped Scaled Armor.
            GOTO :armor
        ) ELSE (
            SET amr_e=ScaledArmor
            SET armor_equip=%scaledA_p%
            SET displayMessage=Equipped Scaled Armor.
            SET maxStam=78
            SET stamina=%maxStam%
            GOTO :armor
        )
    )
)

:equipGuard
IF %guardA_q% EQU 0 (
    GOTO :no_item
) ELSE (
    IF NOT %shd_e% == EMPTY (
        GOTO :shield_armor_conflict
    ) ELSE (
        IF NOT %amr_e% == EMPTY (
            SET amr_e=EMPTY
            SET armor_equip=0
            SET displayMessage=Unequipped Guard Armor.
            GOTO :armor
        ) ELSE (
            SET amr_e=GuardArmor
            SET armor_equip=%guardA_p%
            SET displayMessage=Equipped Guard Armor.
            SET maxStam=82
            SET stamina=%maxStam%
            GOTO :armor
        )
    )
)

:shields
SET curMenu=shields
CLS
ECHO.
TYPE "%cd%\data\ascii\menus\INVENTORY.txt"
ECHO.
ECHO                                   Read Books and Scrolls
ECHO.
ECHO LEVELS: %levels% ^| COINS: %coins% ^| ARMOR: %armor_equip%
ECHO %displayMessage%
ECHO ========================================================================================================================
ECHO [1] BRONZE BUCKLER (%bronze_buckler_q%) ^| [2] KITE SHIELD (%kite_shield_q%) ^| [E] BACK
CHOICE /C 12E /N /M ">"
IF ERRORLEVEL 3 GOTO :dash
IF ERRORLEVEl 2 GOTO :equip_kite
IF ERRORLEVEL 1 GOTO :equip_bronze_buckler

:equip_bronze_buckler
IF %bronze_buckler_q% EQU 0 (
    GOTO :no_item
) ELSE (
    IF NOT %amr_e% == "EMPTY" (
        GOTO :shield_armor_conflict
    ) ELSE (
        IF NOT %shd_e% == "EMPTY" (
            SET shd_e=EMPTY
            SET displayMessage=Unequipped Bronze Buckler.
            GOTO :shields
        ) ELSE (
            SET shd_e=BronzeBuckler
            SET displayMessage=Equipped Bronze Buckler.
            GOTO :shields
        )
    )
)

:equip_kite
IF %kite_shield_q% EQU 0 (
    GOTO :no_item
) ELSE (
    IF NOT %amr_e% == "EMPTY" (
        GOTO :shield_armor_conflict
    ) ELSE (
        IF NOT %shd_e% == "EMPTY" (
            SET shd_e=EMPTY
            SET displayMessage=Unequipped Kite Shield.
            GOTO :shields
        ) ELSE (
            SET shd_e=KiteBuckler
            SET displayMessage=Equipped Kite Shield.
            GOTO :shields
        )
    )
)

:books
SET curMenu=books
CLS
ECHO.
TYPE "%cd%\data\ascii\menus\INVENTORY.txt"
ECHO.
ECHO                                   Read Books and Scrolls
ECHO.
ECHO LEVELS: %levels% ^| COINS: %coins% ^| ARMOR: %armor_equip%
ECHO %displayMessage%
ECHO ========================================================================================================================
ECHO [1 / TRAVELER'S JOURNAL] [2 / GUIDE TO BLADES] [3 / MERCHANT'S GUIDE] [E / EXIT]
CHOICE /C 123E /N /M ">"
IF ERRORLEVEL 4 GOTO :dash
IF ERRORLEVEL 3 GOTO :readMG
IF ERRORLEVEL 2 GOTO :readGTB
IF ERRORLEVEL 1 GOTO :readTJ

:readMG
IF %merchants_guide_q% EQU 0 (
    GOTO :no_bs
) ELSE (
    IF %merchants_guide_r% EQU 1 (
        GOTO :read_already
    ) ELSE (
        SET /A damage_skill=!damage_skill! +1
        SET displayMessage=You read Guide to Merchant's Guide [1] speech skill!
        SET merchants_guide_r=1
        GOTO :books
    )
)

:readGTB
IF %guide_to_blades_q% EQU 0 (
    GOTO :no_bs
) ELSE (
    IF %guide_to_blades_r% EQU 1 (
        GOTO :read_already
    ) ELSE (
        SET /A damage_skill=!damage_skill! +1
        SET displayMessage=You read Guide to Blades and gained [1] damage skill!
        SET guide_to_blades_r=1
        GOTO :books
    )
)

:readTJ
IF %travelers_journal_q% EQU 0 (
    GOTO :no_bs
) ELSE (
    IF %travelers_journal_r% EQU 1 (
        GOTO :read_already
    ) ELSE (
        SET /A damage_skill=!damage_skill! +1
        SET displayMessage=You read Guide to Traveler's Journal [1] stamina skill!
        SET travelers_journal_r=1
        GOTO :books
    )
)

REM Already have this item equipped.
:already_equipped
SET displayMessage=You already have this item equipped.
GOTO :%curMenu%

REM Does not own this item.
:no_item
SET displayMessage=You cannot equip an item you do not own.
GOTO :%curMenu%

REM Shield equipped, armor conflict.
:shield_equippedNAA
SET displayMessage=You cannot wear a shield and armor at the same time.
GOTO :%curMenu%

REM You don't own / this item doesn't exist.
:no_bs
SET displayMessage=You don't own this scroll / book.
GOTO :%curMenu%

REM Already read this book and gained  the skill point.
:read_already
SET displayMessage=You've already read this scroll / book.
GOTO :%curMenu%

:shield_conflict
SET displayMessage=A shield is already equipped! Unequip it before trying to equip this shield.
GOTO :shields

:shield_armor_conflict
SET displayMessage=You cannot equip both armor and a shield!
GOTO :shields