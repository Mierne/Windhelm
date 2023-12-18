@ECHO OFF
TITLE (Windhelm Castle) High Quarter - J'Zar Almani ^| %player_name% the %player_class%
REM Wizard NPC v2 (231218) - for Windhelm Build 2 "Bottle o' Features"

REM Check Affinity level and then enable/disable discounts.
:CA
IF %player_affinity_wizard% GEQ 400 (
    SET wizDA=1
    GOTO :MAIN_MENU
) ELSE (
    SET wizDA=0
    GOTO :MAIN_MENU
)

:MAIN_MENU
CLS
ECHO.
ECHO                                         J'ZAR ALMANI
ECHO                     I've many tonics.. Or perhaps scrolls interest you more?
ECHO.
ECHO LEVELS: %LEVELS% ^| COINS: %COINS% ^| AFFINITY: %player_affinity_wizard%
ECHO %displayMessage%
ECHO ========================================================================================================================
ECHO [1 / BUY ROBES ] ^| [2 / SKILL POINTS ] ^| [T / TALK ] ^| [S / SELL ] ^| [E / LEAVE ]                         
CHOICE /C 12TSE /N /M ">"
IF ERRORLEVEL 4 GOTO :EOF
IF ERRORLEVEL 3 GOTO :SELL_ITEMS
IF ERRORLEVEL 2 GOTO :SKILL_POINTS
IF ERRORLEVEL 1 GOTO :BUY_ROBES

REM Buy Robes
:BUY_ROBES
CLS
ECHO type command goes here.
ECHO +--------------------------------------------------------------------------------------------------+
ECHO ^|                             Hm. Take a look, I have what you seek.                                +
ECHO ^| %displayMessage%
ECHO +--------------------------------------------------------------------------------------------------+
ECHO + STATUS: %player_effect_1% , %player_effect_2%
ECHO +--------------------------------------------------------------------------------------------------+
ECHO ^| COINS: %coins% ^| AFFINITY: %player_affinity_wizard%
ECHO +--------------------------------------------------------------------------------------------------+
ECHO +                                          ITEM STOCK                                                +
ECHO +--------------------------------------------------------------------------------------------------+
ECHO ^| BASIC ROBES: %bRobes_s%, PRICE: %bRobes_s%
ECHO ^| INTERMEDIATE ROBES: %iRobes_s%, PRICE: %iRobes_s%
ECHO ^| ADVANDED ROBES: %aRobes_s%, PRICE: %aRobes_s%
ECHO +--------------------------------------------------------------------------------------------------+
ECHO + [1 / BASIC ROBES ] ^| [2 / INTERMEDIATE ROBES ] ^| [3 / ADVANDED ROBES ] ^| [E / BACK ]                +
ECHO +--------------------------------------------------------------------------------------------------+
CHOICE /C 123E /N /M ">"
IF ERRORLEVEL 4 GOTO :MAIN_MENU
IF ERRORLEVEL 3 GOTO :BUY_ADVANCED_ROBES
IF ERRORLEVEL 2 GOTO :BUY_INTERMEDIATE_ROBES
IF ERRORLEVEL 1 GOTO :BUY_BASIC_ROBES

REM Purchase "Basic Robes".
:BUY_BASIC_ROBES
REM Check if Discounts are active.
IF %wizDA% EQU 1 (
    REM Check if the Player can afford the item.
    IF %coins% LSS 460 (
        REM The Player cannot afford this item.
        SET displayMessage=No can do little Shard, you must pay...
        GOTO :BUY_ROBES
    ) ELSE (
        REM Take the coins, remove [1] of the item from the Alchemist's stock and give [1] of the item to the Player.
        SET /A coins=!coins! -%bRobes_p%
        REM Apply the Discount.
        SET /A coins=!coins! +%bRobes_affinityleveltwo_d%
        REM Remove [1] of this item from the Merchant's stock.
        SET /A bRobes_s=bRobes_s -1
        REM Add [1] of this item to the Player's inventory.
        SET /A bRobes_q=!bRobes_q! +1
        SET displayMessage=Purchased 1 Basic Robe for 460 coins.
        GOTO :BUY_ROBES
    )
) ELSE (
    REM Check if the Player can afford the item.
    IF %coins% LSS 500 (
        REM The Player cannot afford this item.
        SET displayMessage=No can do little Shard, you must pay...
        GOTO :BUY_ROBES
    ) ELSE (
        REM Take the coins, remove [1] of the item from the Alchemist's stock and give [1] of the item to the Player.
        SET /A coins=!coins! -%bRobes_p%
        REM Remove [1] of this item from the Merchant's stock.
        SET /A bRobes_s=!bRobes_s! -1
        REM Add [1] of this item to the Player's inventory.
        SET /A bRobes_q=!bRobes_q! +1
        SET displayMessage=Purchased 1 Basic Robe for 500 coins.
        GOTO :BUY_ROBES
    )
)

REM Purchase "Intermediate Robes".
:BUY_BASIC_ROBES
REM Check if Discounts are active.
IF %wizDA% EQU 1 (
    REM Check if the Player can afford the item.
    IF %coins% LSS 1100 (
        REM The Player cannot afford this item.
        SET displayMessage=No can do little Shard, you must pay...
        GOTO :BUY_ROBES
    ) ELSE (
        REM Take the coins, remove [1] of the item from the Alchemist's stock and give [1] of the item to the Player.
        SET /A coins=!coins! -%iRobes_p%
        REM Apply the Discount.
        SET /A coins=!coins! +%iRobes_affinityleveltwo_d%
        REM Remove [1] of this item from the Merchant's stock.
        SET /A iRobes_s=iRobes_s -1
        REM Add [1] of this item to the Player's inventory.
        SET /A iRobes_q=!iRobes_q! +1
        SET displayMessage=Purchased 1 Intermediate Robe for 1100 coins.
        GOTO :BUY_ROBES
    )
) ELSE (
    REM Check if the Player can afford the item.
    IF %coins% LSS 1200 (
        REM The Player cannot afford this item.
        SET displayMessage=No can do little Shard, you must pay...
        GOTO :BUY_ROBES
    ) ELSE (
        REM Take the coins, remove [1] of the item from the Alchemist's stock and give [1] of the item to the Player.
        SET /A coins=!coins! -%bRobes_p%
        REM Remove [1] of this item from the Merchant's stock.
        SET /A iRobes_s=!iRobes_s! -1
        REM Add [1] of this item to the Player's inventory.
        SET /A iRobes_q=!iRobes_q! +1
        SET displayMessage=Purchased 1 Intermediate Robe for 1200 coins.
        GOTO :BUY_ROBES
    )
)

REM Purchase "Advanced Robes".
:BUY_BASIC_ROBES
REM Check if Discounts are active.
IF %wizDA% EQU 1 (
    REM Check if the Player can afford the item.
    IF %coins% LSS 4800 (
        REM The Player cannot afford this item.
        SET displayMessage=No can do little Shard, you must pay...
        GOTO :BUY_ROBES
    ) ELSE (
        REM Take the coins, remove [1] of the item from the Alchemist's stock and give [1] of the item to the Player.
        SET /A coins=!coins! -%aRobes_p%
        REM Apply the Discount.
        SET /A coins=!coins! +%aRobes_affinityleveltwo_d%
        REM Remove [1] of this item from the Merchant's stock.
        SET /A aRobes_s=aRobes_s -1
        REM Add [1] of this item to the Player's inventory.
        SET /A aRobes_q=!aRobes_q! +1
        SET displayMessage=Purchased 1 Advanced Robe for 4800 coins.
        GOTO :BUY_ROBES
    )
) ELSE (
    REM Check if the Player can afford the item.
    IF %coins% LSS 5000 (
        REM The Player cannot afford this item.
        SET displayMessage=No can do little Shard, you must pay...
        GOTO :BUY_ROBES
    ) ELSE (
        REM Take the coins, remove [1] of the item from the Alchemist's stock and give [1] of the item to the Player.
        SET /A coins=!coins! -%aRobes_p%
        REM Remove [1] of this item from the Merchant's stock.
        SET /A aRobes_s=!aRobes_s! -1
        REM Add [1] of this item to the Player's inventory.
        SET /A aRobes_q=!aRobes_q! +1
        SET displayMessage=Purchased 1 Advanced Robe for 5000 coins.
        GOTO :BUY_ROBES
    )
)

REM Apply skill points / upgrade specific stats.
:SKILL_POINTS
CLS
ECHO.
type "%cd%\data\TITLES\menus\skills.txt"
ECHO +--------------------------------------------------------------------------------------------------+
ECHO ^|                             I believe I can manage this, yes...                                   +
ECHO ^| %displayMessage%
ECHO +--------------------------------------------------------------------------------------------------+
ECHO + Damage Skill: %damage_skill% ^| Stamina Skill: %stamina_skill% ^| Magicka Skill: %magicka_skill%
ECHO + Speech Skill: %speech_skill%
ECHO +--------------------------------------------------------------------------------------------------+
ECHO ^| COINS: %coins% ^| LEVELS: %levels% ^| AFFINITY: %player_affinity_wizard%
ECHO +--------------------------------------------------------------------------------------------------+
ECHO +                                  SKILL LEVEL INFORMATION                                           +
ECHO +--------------------------------------------------------------------------------------------------+
ECHO ^| DAMAGE +1, -20 LEVELS ^| STAMINA +1, -12 LEVELS ^| MAGICKA +1, -20 LEVELS                         +                 
ECHO ^| SPEECH +1, -8 LEVELS                                                                              +
ECHO +--------------------------------------------------------------------------------------------------+
ECHO + [1 / ASSIGN DAMAGE ] ^| [2 / ASSIGN STAMINA ] ^| [3 / ASSIGN MAGICKA ]                             +
ECHO + [4 / ASSIGN SPEECH ] ^| [E / BACK ]                                                                +
ECHO +--------------------------------------------------------------------------------------------------+
CHOICE /C 1234E /N /M ">"
IF ERRORLEVEL 5 GOTO :MAIN_MENU
IF ERRORLEVEL 4 GOTO :APPLY__SPEECH
IF ERRORLEVEL 3 GOTO :APPLY_MAGICKA
IF ERRORLEVEL 2 GOTO :APPLY_STAMINA
IF ERRORLEVEL 1 GOTO :APPLY_DAMAGE

REM Check for max skill level caps and conflicting levels.
:APPLY_DAMAGE
IF %damage_skill% EQU 10 (
    REM Max Skill Level.
    SET displayMessage=Damage Skill is currently at the max level.
    GOTO :SKILL_POINTS
) ELSE IF %magicka_skill% EQU 8 (
    IF %damage_skill% LSS 8 (
        REM Apply damage skill, as it has not yet reached the cap.
        REM Apply [1] skill point for [20] levels.
        SET /A LEVELS=!LEVELS -20
        SET /A damage_skill=!damage_skill! +1
        SET displayMessage=Applied +1 Damage Skill for -20 Levels.
    GOTO :SKILL_POINTS
    ) ELSE (
        REM Skill Level Conflict.
        SET displayMessage=Damage Skill cannot be increased further due to the Magicka Skill.
        GOTO :SKILL_POINTS
    )
) ELSE (
    REM Apply [1] skill point for [20] levels.
    SET /A LEVELS=!LEVELS -20
    SET /A damage_skill=!damage_skill! +1
    SET displayMessage=Applied +1 Damage Skill for -20 Levels.
    GOTO :SKILL_POINTS
)

REM Check for max skill level caps and conflicting levels.
:APPLY_STAMINA
IF %stamina_skill% EQU 10 (
    REM Max Skill Level.
    SET displayMessage=Stamina Skill is currently at the max level.
    GOTO :SKILL_POINTS
) ELSE IF %magicka_skill% EQU 8 (
    IF %stamina_skill% LSS 8 (
        REM Apply Stamina skill, as it has not yet reached the cap.
        REM Apply [1] skill point for [12] levels.
        SET /A LEVELS=!LEVELS -12
        SET /A stamina_skill=!stamina_skill! +1
        SET displayMessage=Applied +1 Stamina Skill for -12 Levels.
    GOTO :SKILL_POINTS
    ) ELSE (
        REM Skill Level Conflict.
        SET displayMessage=Damage Skill cannot be increased further due to the Magicka Skill.
        GOTO :SKILL_POINTS
    )
) ELSE (
    REM Apply [1] skill point for [12] levels.
    SET /A LEVELS=!LEVELS -12
    SET /A stamina_skill=!stamina_skill! +1
    SET displayMessage=Applied +1 Stamina Skill for -12 Levels.
    GOTO :SKILL_POINTS
)

REM Check for max skill level caps and conflicting levels.
:APPLY_MAGICKA
IF %magicka_skill% EQU 10 (
    REM Max Skill Level.
    SET displayMessage=Magicka Skill is currently at the max level.
    GOTO :SKILL_POINTS
) ELSE IF %damage_skill% EQU 8 (
    IF %magicka_skill% LSS 8 (
        REM Apply Magicka skill, as it has not yet reached the cap.
        SET /A LEVELS=!LEVELS -20
        SET /A magicka_skill=!magicka_skill! +1
        SET displayMessage=Applied +1 Magicka Skill for -20 Levels.
    GOTO :SKILL_POINTS
    ) ELSE (
        REM Skill Level Conflict.
        SET displayMessage=Magicka Skill cannot be increased further due to the Damage Skill.
        GOTO :SKILL_POINTS
    )
) ELSE (
    REM Apply [1] skill point for [20] levels.
    SET /A LEVELS=!LEVELS -20
    SET /A magicka_skill=!magicka_skill! +1
    SET displayMessage=Applied +1 Magicka Skill for -20 Levels.
    GOTO :SKILL_POINTS
)

REM Check for max skill level caps and conflicting levels.
:APPLY_SPEECH
IF %speech_skill% EQU 10 (
    REM Max Skill Level.
    SET displayMessage=Speech Skill is currently at the max level.
    GOTO :SKILL_POINTS
) ELSE IF %damage_skill% EQU 8 (
    IF %speech_skill% LSS 8 (
        REM Apply Speech skill, as it has not yet reached the cap.
        REM Apply [1] skill point for [8] levels.
        SET /A LEVELS=!LEVELS -8
        SET /A speech_skill=!speech_skill! +1
        SET displayMessage=Applied +1 Speech Skill for -8 Levels.
        GOTO :SKILL_POINTS
    ) ELSE (
        REM Skill Level Conflict.
        SET displayMessage=Speech Skill cannot be increased further due to the Damage Skill.
        GOTO :SKILL_POINTS
    )
) ELSE (
    REM Apply [1] skill point for [8] levels.
    SET /A LEVELS=!LEVELS -8
    SET /A speech_skill=!speech_skill! +1
    SET displayMessage=Applied +1 Speech Skill for -8 Levels.
    GOTO :SKILL_POINTS
)