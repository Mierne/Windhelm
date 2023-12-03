@ECHO OFF
TITLE Exploration Engine - Rockwinn Plaza ^| NAME: %player_name% ^| CLASS: %player_class%
REM RWP.BAT (Rockwinn Plaza Cell) v1 231202

REM Unique NPC encounter chance (RARE).
:RNPCE
SET /A RE=%RANDOM% %%20
IF %RE% EQU 2 (
    REM Unique Encounter.
    IF %GRMencountered% EQU 1 (
        GOTO :RWP_main
    )
    GOTO :RWP_UE
) ELSE (
    GOTO :RWP_main
)

REM Rare NPC encounter.
:RWP_UE
SET LS=RWP_UE
CLS
ECHO.
TYPE "TITLE\PATH\HERE"
ECHO.
ECHO                             You enter the busy street, you notice a Bard advertising his services.
ECHO +----------------------------------------------------------------------------------------------------------------------+
ECHO +                                 HP / %hp% ^| COINS / %coins% ^| ARMOR / %armor_equip% ^| LEVELS / %levels%
ECHO + %displayMessage%
ECHO +----------------------------------------------------------------------------------------------------------------------+
ECHO                   [1 / ALCHEMIST ] ^| [2 / ARMORER ] ^| [3 / BLACKSMITH ] ^| [4 / THE BARD ] [E / GO BACK ]
CHOICE /C 1234E /N /M ">"
IF ERRORLEVEL 5 GOTO :RTW
IF ERRORLEVEL 4 GOTO :GM
IF ERRORLEVEL 3 GOTO :Blacksmith
IF ERRORLEVEL 2 GOTO :Armorer
IF ERRORLEVEL 1 GOTO :Alchemist

REM Main screen.
:RWP_main
SET LS=RWP_main
CLS
ECHO.
TYPE "TITLE\PATH\HERE"
ECHO.
ECHO                               A busy street, you see other people shopping at Market stalls.
ECHO +----------------------------------------------------------------------------------------------------------------------+
ECHO +                                 HP / %hp% ^| COINS / %coins% ^| ARMOR / %armor_equip% ^| LEVELS / %levels%
ECHO + %displayMessage%
ECHO +----------------------------------------------------------------------------------------------------------------------+
ECHO                   [1 / ALCHEMIST ] ^| [2 / ARMORER ] ^| [3 / BLACKSMITH ] ^| [E / GO BACK ]
CHOICE /C 123E /N /M ">"
IF ERRORLEVEL 4 GOTO :RTW
IF ERRORLEVEL 3 GOTO :Blacksmith
IF ERRORLEVEL 2 GOTO :Armorer
IF ERRORLEVEL 1 GOTO :Alchemist

REM Call the Alchemist NPC script.
:Alchemist
CALL "%cd%\data\Exploration Engine\Cells\Rockwinn Plaza\NPCs\Alchemist.bat"
GOTO :%LS%

REM Call the Armorer NPC script.
:Armorer
CALL "%cd%\data\Exploration Engine\Cells\Rockwinn Plaza\NPCs\Armorer.bat"
GOTO :%LS%

REM Call the Blacksmith NPC script.
:Blacksmith
CALL "%cd%\data\Exploration Engine\Cells\Rockwinn Plaza\NPCs\Blacksmith.bat"
GOTO :%LS%

REM "Return to Windhelm"
:RTW
SET LL=RTW
GOTO :EOF