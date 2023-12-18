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
ECHO + Damage Skill: %damage_skill% ^| Stamina Skill: %stamina_skill% ^| Magicka Skill: %magicka_skill%
ECHO + Speech Skill: %speech_skill%
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