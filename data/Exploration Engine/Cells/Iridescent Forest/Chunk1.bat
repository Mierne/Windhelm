@ECHO OFF
TITLE Iridescent Forest (EXPLORE) - Chunk 1
REM Chunk 1 (231222)
REM --
REM Chunk 1 contains low-level enemies, such as the Bandit and Jester.
REM This chunk also contains several NPCs important to the story, and will help guide the Player.

REM Main screen, like a hub of sorts.
:MAIN
SET LC=MAIN
CLS
ECHO.
TYPE "TITLE\PATH\HERE"
ECHO.
ECHO %displayMessage%
ECHO =====================================================================================================
ECHO [1 / EXPLORE ] ^| [ I / INVENTORY ] ^| [E / GO BACK ]
CHOICE /C 1IE /N /M ">"
IF ERRORLEVEL 3 GOTO :AUTOSAVE
IF ERRORLEVEL 2 GOTO :INVENTORY
IF ERRORLEVEL 1 GOTO :MOVEMENT_CHECK

REM Checks the Players HP to prevent instant-death in an encounter.
:MOVEMENT_CHECK
IF %HP% LEQ 50 (
    GOTO :HPTL
) ELSE (
    GOTO :ENCOUNTER_CHECK
)

REM Does the Player encounter an enemy or NPC?
:ENCOUNTER_CHECK
SET /A NOE=%RANDOM% %%4
IF %NOE% GEQ 3 (
    GOTO :ENCOUNTER_LIST
) ELSE IF %NOE% LEQ 2 (
    REM NPC Encounters, call a function to decide which NPC is encountered.
    REM Unfinished.
    REM Since this isn't ready - just redirect to Enemy Encounters.
    GOTO :ENCOUNTER_LIST
)

:ENCOUNTER_LIST
SET /A WE=%RANDOM% %%5
IF %WE% EQU 1 (
    REM Bandit Encounter.
    SET currentEnemy=iBandit
    CALL "%cd%\data\Combat Engine\scripts\evie.bat"
    REM Return to Main Menu after battle is complete.
    GOTO :MAIN
) ELSE IF %WE% EQU 2 (
    REM Jester Encounter.
    SET currentEnemy=iJester
    CALL "%cd%\data\Combat Engine\scripts\evie.bat"
    REM Return to Main Menu after battle is complete.
    GOTO :MAIN
) ELSE IF %WE% EQU 3 (
    REM Gnome Encounter.
    SET currentEnemy=iGnome
    CALL "%cd%\data\Combat Engine\scripts\evie.bat"
    REM Return to Main Menu after battle is complete.
    GOTO :MAIN
) ELSE IF %WE% EQU 4 (
    REM Hunter Encounter.
    SET currentEnemy=iHunter
    CALL "%cd%\data\Combat Engine\scripts\evie.bat"
    REM Return to Main Menu after battle is complete.
    GOTO :MAIN
) ELSE IF %WE% EQU 5 (
    REM Goblin Encounter.
    SET currentEnemy=iGoblin
    CALL "%cd%\data\Combat Engine\scripts\evie.bat"
    REM Return to Main Menu after battle is complete.
    GOTO :MAIN
)

REM Encountered NPCs are limited on a Cell by Cell basis.
REM Which NPCs can be encountered in this Cell?
:NPC_FIND
SET /A WP=%RANDOM% %%3

SET /A E=%RANDOM% %%6
IF %E% EQU 1 (
    REM Encounter Nothing
    SET displayMessage=You walk for several minutes, but find nothing.
    GOTO :MAIN
) ELSE IF %E% EQU 2 (
    REM Shard Encounter.
    REM Not programmed.
) ELSE IF %E% EQU 3 (
    REM Memory Encounter
    REM Not programmed.
    GOTO :MAIN
) ELSE (
    REM Error handling.
    SET errorType=encounterError
    ECHO Encounter Error - Corrupted script or save file. >> EE-Chunk1.log
    CALL "%cd%\data\functions\Error Handler.bat"
    EXIT /B
)

REM Call SLOP and save the game before exiting Exploration Engine.
:AUTOSAVE
SET SLOPr=SAVE
CALL "%cd%\data\functions\SLOP.bat"
GOTO :EOF