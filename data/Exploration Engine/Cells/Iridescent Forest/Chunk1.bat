@ECHO OFF
TITLE Iridescent Forest (EXPLORE) - Chunk 1
REM Chunk 1 (231201)
REM --

REM There are 5 posible positions in each chunk and 4 "directions" in each position, each "direction" can be explored 3 times.
REM When a savegame is loaded and the Player explores,
REM We need to find the chunk and position they were last in.
:POS_CHECK
IF %LC% EQU 1 (
    IF %CPD% EQU 1 (
        REM 1 EQU North.
        GOTO :ChunkPos1N
    ) ELSE IF %CPD% EQU 2 (
        REM 2 EQU East.
        GOTO :ChunkPos1E
    ) ELSE IF %CPD% 3 (
        REM 3 EQU South.
        GOTO :ChunkPos1S
    ) ELSE IF %CPD% 4 (
        REM 4 EQU West.
        GOTO :ChunkPos1W
    )
) ELSE IF %LC% EQU 2 (
    IF %CPD% EQU 1 (
        REM 1 EQU North.
        GOTO :ChunkPos2N
    ) ELSE IF %CPD% EQU 2 (
        REM 2 EQU East.
        GOTO :ChunkPos2E
    ) ELSE IF %CPD% 3 (
        REM 3 EQU South.
        GOTO :ChunkPos2S
    ) ELSE IF %CPD% 4 (
        REM 4 EQU West.
        GOTO :ChunkPos2W
    )
) ELSE IF %LC% EQU 3 (
    IF %CPD% EQU 1 (
        REM 1 EQU North.
        GOTO :ChunkPos3N
    ) ELSE IF %CPD% EQU 2 (
        REM 2 EQU East.
        GOTO :ChunkPos3E
    ) ELSE IF %CPD% 3 (
        REM 3 EQU South.
        GOTO :ChunkPos3S
    ) ELSE IF %CPD% 4 (
        REM 4 EQU West.
        GOTO :ChunkPos3W
    )
) ELSE IF %LC% EQU 4 (
    IF %CPD% EQU 1 (
        REM 1 EQU North.
        GOTO :ChunkPos4N
    ) ELSE IF %CPD% EQU 2 (
        REM 2 EQU East.
        GOTO :ChunkPos4E
    ) ELSE IF %CPD% 3 (
        REM 3 EQU South.
        GOTO :ChunkPos4S
    ) ELSE IF %CPD% 4 (
        REM 4 EQU West.
        GOTO :ChunkPos4W
    )
) ELSE IF %LC% EQU 5 (
    IF %CPD% EQU 1 (
        REM 1 EQU North.
        GOTO :ChunkPos5N
    ) ELSE IF %CPD% EQU 2 (
        REM 2 EQU East.
        GOTO :ChunkPos5E
    ) ELSE IF %CPD% 3 (
        REM 3 EQU South.
        GOTO :ChunkPos5S
    ) ELSE IF %CPD% 4 (
        REM 4 EQU West.
        GOTO :ChunkPos5W
    )
) ELSE (
    REM error
    ECHO errorType=ChunkPos. >> log.txt
    EXIT /B
)

REM "Main" area of a Chunk Direction.
:ChunkPos1N
SET LC=ChunkPos1N
CLS
ECHO.
TYPE "TITLE\PATH\HERE"
ECHO.
ECHO DEBUG: movement in this direction left: %C1P1NM%
ECHO Where would you like to go?
ECHO %displayMessage%
ECHO =====================================================================================================
ECHO [1 / GO NORTH ] ^| [2 / GO SOUTH ] ^|[3 / GO EAST ] ^| [4 / GO WEST ] ^| [E / GO BACK ]
CHOICE /C 1234E /N /M ">"
IF ERRORLEVEL 5 GOTO :AUTOSAVE
IF ERRORLEVEL 4 GOTO :C1Wc
IF ERRORLEVEL 3 GOTO :C1Ec
IF ERRORLEVEL 2 GOTO :C1Sc
IF ERRORLEVEL 1 GOTO :C1Nc

REM North movement point check.
REM If zero, direction is blocked, otherwise continue.
:C1Nc
IF %C1P1NM% GTR 0 (
    SET /A C1P1NM=!C1P1NM! -1
    SET displayMessage=Moved North.
    SET LC=C1P1N
    GOTO :C1P1Nencheck
) ELSE (
    SET displayMessage=Your path is blocked.
    GOTO :%LC%
)

REM Encounter check. Will the Player encounter an enemy, NPC or item?
GOTO :C1P1Nencheck
SET /A C1E=%RANDOM% %%10
IF %C1E% LSS 2 (
    REM Ultra rare loot.
    SET displayMessage=Discovered a chest full of Gold!
    SET /A COINS=!COINS! +2000
    GOTO :%LC%
) ELSE IF %C1E% GTR 9 (
    REM Found nothing.
    SET displayMessage=You find nothing but more... Forest.
    GOTO :%LC%
) ELSE IF %C1E% GTR 6 (
    REM Bandit Encounter.
    SET displayMessage=A Bandit appears before you, blocking your path.
    set currentEnemy=iBandit
    CALL "%cd%\data\functions\Combat Engine\scripts\var_handler.bat"
    GOTO :%LC%
) ELSE IF %C1E% GTR 2 (
    REM Common loot.
    SET displayMessage=Found 13 Gold!
    SET /A COINS=!COINS! +13
    GOTO :%LC%
)

REM 1 movement point North of ChunkPos1.
:C1P1N
REM If the movement points have been reset, go back to the "Main" direction to allow exploration of any direction.
IF %C1P1NM% EQU 3 GOTO :ChunkPos1N
SET LC=C1P1N
CLS
ECHO.
TYPE "TITLE\PATH\HERE"
ECHO.
ECHO DEBUG: Current Pos: %C1P1NM%
ECHO Where would you like to go?
ECHO %displayMessage%
ECHO =====================================================================================================
ECHO [1 / GO NORTH ] ^| [X / GO SOUTH ] ^|[X / GO EAST ] ^| [X / GO WEST ] ^| [E / GO BACK ]
CHOICE /C 1E /N /M ">"
IF ERRORLEVEL 2 GOTO :C1PD
IF ERRORLEVEL 1 GOTO :C1Nc

REM "Go Back", adds +1 to C1P1NM.
:C1PD
SET /A C1P1NM=!C1P1NM! +1
IF %C1P1NM% GTR 3 SET C1P1NM=3
GOTO :ChunkPos1N


REM Call SLOP and save the game before exiting Exploration Engine.
:AUTOSAVE
SET SLOPr=SAVE
CALL "%cd%\data\functions\SLOP.bat"
GOTO :EOF