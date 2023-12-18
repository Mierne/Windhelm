@ECHO OFF
TITLE (Windhelm Castle) High Quarter - J'Zar Almani ^| %player_name% the %player_class%
REM Wizard NPC v2 (231217) - for Windhelm Build 2 "Bottle o' Features"

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

REM Apply skill points / upgrade specific stats.
:SKILL_POINTS
CLS
ECHO.
type "%cd%\data\TITLES\menus\skills.txt"
ECHO +--------------------------------------------------------------------------------------------------+
ECHO ^|                             I believe I can manage this, yes...                                   +
ECHO ^| %displayMessage%
ECHO +--------------------------------------------------------------------------------------------------+
ECHO + Damage Skill: %damageSkill% ^| Stamina Skill: %staminaSkill% ^| Magicka Skill: %magickaSkill%
ECHO + Speech Skill: %speechSkill%
ECHO +--------------------------------------------------------------------------------------------------+
ECHO ^| COINS: %coins% ^| LEVELS: %levels% ^| AFFINITY: %player_affinity_wizard%
ECHO +--------------------------------------------------------------------------------------------------+
ECHO +                                          ITEM STOCK                                                +
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
IF %damageSkill% EQU 10 (
    REM Max Skill Level.
    SET displayMessage=Damage Skill is currently at the max level.
    GOTO :SKILL_POINTS
) ELSE IF %magickaSkill% EQU 8 (
    IF %damageSkill% LSS 8 (
        REM Apply damage skill, as it has not yet reached the cap.
        REM Apply [1] skill point for [20] levels.
        SET /A LEVELS=!LEVELS -20
        SET /A damageSkill=!damageSkill! +1
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
    SET /A damageSkill=!damageSkill! +1
    SET displayMessage=Applied +1 Damage Skill for -20 Levels.
    GOTO :SKILL_POINTS
)

REM Check for max skill level caps and conflicting levels.
:APPLY_STAMINA
IF %staminaSkill% EQU 10 (
    REM Max Skill Level.
    SET displayMessage=Stamina Skill is currently at the max level.
    GOTO :SKILL_POINTS
) ELSE IF %magickaSkill% EQU 8 (
    IF %staminaSkill% LSS 8 (
        REM Apply Stamina skill, as it has not yet reached the cap.
        REM Apply [1] skill point for [12] levels.
        SET /A LEVELS=!LEVELS -12
        SET /A staminaSkill=!staminaSkill! +1
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
    SET /A staminaSkill=!staminaSkill! +1
    SET displayMessage=Applied +1 Stamina Skill for -12 Levels.
    GOTO :SKILL_POINTS
)

REM Check for max skill level caps and conflicting levels.
:APPLY_MAGICKA
IF %magickaSkill% EQU 10 (
    REM Max Skill Level.
    SET displayMessage=Magicka Skill is currently at the max level.
    GOTO :SKILL_POINTS
) ELSE IF %damageSkill% EQU 8 (
    IF %magickaSkill% LSS 8 (
        REM Apply Magicka skill, as it has not yet reached the cap.
        SET /A LEVELS=!LEVELS -20
        SET /A magickaSkill=!magickaSkill! +1
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
    SET /A magickaSkill=!magickaSkill! +1
    SET displayMessage=Applied +1 Magicka Skill for -20 Levels.
    GOTO :SKILL_POINTS
)

REM Check for max skill level caps and conflicting levels.
:APPLY_SPEECH
IF %speechSkill% EQU 10 (
    REM Max Skill Level.
    SET displayMessage=Speech Skill is currently at the max level.
    GOTO :SKILL_POINTS
) ELSE IF %damageSkill% EQU 8 (
    IF %speechSkill% LSS 8 (
        REM Apply Speech skill, as it has not yet reached the cap.
        REM Apply [1] skill point for [8] levels.
        SET /A LEVELS=!LEVELS -8
        SET /A speechSkill=!speechSkill! +1
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
    SET /A speechSkill=!speechSkill! +1
    SET displayMessage=Applied +1 Speech Skill for -8 Levels.
    GOTO :SKILL_POINTS
)