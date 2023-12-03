@ECHO OFF
TITLE Exploration Engine - Windhelm High Quarter ^| NAME: %player_name% ^| CLASS: %player_class%
REM WHQ.BAT v1 (231202)

REM Unique NPC encounter chance (RARE).
:RNPCE
SET /A RE=%RANDOM% %%20
IF %RE% EQU 2 (
    REM Unique Encounter.
    IF %CBWencountered% EQU 1 (
        GOTO :WHQ_MAIN
    )
    GOTO :WHQ_UE
) ELSE (
    GOTO :WHQ_MAIN
)

REM Clarke Blackwell Encounter.
:WHQ_UE
SET LS=WHQ_UE
CLS
ECHO.
TYPE "TITLE\PATH\HERE"
ECHO.
ECHO                           You notice a strange figure floating above a stack of crates.
ECHO +----------------------------------------------------------------------------------------------------------------------+
ECHO +                                 HP / %hp% ^| COINS / %coins% ^| ARMOR / %armor_equip% ^| LEVELS / %levels%
ECHO + %displayMessage%
ECHO +----------------------------------------------------------------------------------------------------------------------+
ECHO                   [1 / LOREKEEPER ] ^| [2 / WIZARD ] ^| [4 / Approach the figure ] ^| [E / GO BACK ]
CHOICE /C 123E /N /M ">"
IF ERRORLEVEL 4 GOTO :RTW
IF ERRORLEVEL 3 GOTO :CLARKE
IF ERRORLEVEL 2 GOTO :WIZARD
IF ERRORLEVEL 1 GOTO :LOREKEEPER


REM Normal menu.
:WHQ_MAIN
SET LS=WHQ_MAIN
CLS
ECHO.
TYPE "TITLE\PATH\HERE"
ECHO.
ECHO       The streets here are neat and empty, a warm light from the streetlamps fills you with a familiar warmth.
ECHO +----------------------------------------------------------------------------------------------------------------------+
ECHO +                                 HP / %hp% ^| COINS / %coins% ^| ARMOR / %armor_equip% ^| LEVELS / %levels%
ECHO + %displayMessage%
ECHO +----------------------------------------------------------------------------------------------------------------------+
ECHO                   [1 / LOREKEEPER ] ^| [2 / WIZARD ] ^| [E / GO BACK ]
CHOICE /C 12E /N /M ">"
IF ERRORLEVEL 3 GOTO :RTW
IF ERRORLEVEL 2 GOTO :WIZARD
IF ERRORLEVEL 1 GOTO :LOREKEEPER

REM Call the Lorekeeper NPC script.
:LOREKEEPER
CALL "%cd%\data\Exploration Engine\Cells\Windhelm High Quarter\NPCs\Lorekeeper.bat"
GOTO :%LS%

REM Call the Wizard NPC script.
:WIZARD
CALL "%cd%\data\Exploration Engine\Cells\Windhelm High Quarter\NPCs\Wizard.bat"
GOTO :%LS%

REM Call the Clarke Blackwell NPC script.
:CLARKE
CALL "%cd%\data\Exploration Engine\Cells\Windhelm High Quarter\NPCs\ClarkeBlackwell.bat"
GOTO :%LS%

REM "Return to Windhelm"
:RTW
SET LL=RTW
GOTO :EOF