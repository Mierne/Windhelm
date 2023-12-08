@ECHO OFF
TITLE Iridescent Forest (EXPLORE) - Chunk 1
REM Chunk 1 (231202)
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
REM Debug move
SET currentEnemy=iBandit
CALL "%cd%\data\Combat Engine\scripts\var_handler.bat"
REM - - Debug move end
IF %HP% LSS 50 (
    GOTO :HPTL
) ELSE (
    GOTO :ENCOUNTER_CHECK
)

REM Does the Player encounter an enemy or NPC?
:ENCOUNTER_CHECK
SET /A E=%RANDOM% %%6
IF %E% EQU 1 (
    REM Jester Encounter
    SET currentEnemy=iJester
    CALL "%cd%\data\Combat Engine\scripts\var_handler.bat"
    IF %HP% LEQ 0 (
        SET displayMessage=You wake up and find yourself safe within the walls of Windhelm.
        GOTO :AUTOSAVE
    ) ELSE (
        GOTO :MAIN
    )
) ELSE IF %E% EQU 2 (
    REM Bandit Encounter
    SET currentEnemy=iBandit
    CALL "%cd%\data\Combat Engine\scripts\var_handler.bat"
    IF %HP% LEQ 0 (
        SET displayMessage=You wake up and find yourself safe within the walls of Windhelm.
        GOTO :AUTOSAVE
    ) ELSE (
        GOTO :MAIN
    )
) ELSE IF %E% EQU 3 (
    REM Encounter Nothing
    SET displayMessage=You walk for several minutes, but find nothing.
    GOTO :MAIN
) ELSE IF %E% EQU 4 (
    REM Find 13 Gold.
    SET displayMessage=You stumble upon a coin purse alongside the path, it had 13 gold.
    SET /A COINS=!COINS! +13
    GOTO :MAIN
) ELSE IF %E% EQU 5 (
    REM Memory Encounter
    REM Not programmed.
    GOTO :MAIN
) ELSE IF %E% EQU 6 (
    REM Shard Encounter
    REM Not programmed.
    GOTO :MAIN
) ELSE (
    REM Error handling.
    SET errorType=Explore Error, encounter. >> EE-log.txt
)

REM Call SLOP and save the game before exiting Exploration Engine.
:AUTOSAVE
SET SLOPr=SAVE
CALL "%cd%\data\functions\SLOP.bat"
GOTO :EOF