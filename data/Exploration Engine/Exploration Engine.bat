@ECHO OFF
TITLE Windhelm ^| Exploration Engine ^| Name: %player_name% ^| Class: %player_class%
REM Exploration Engine v1 (231222) for Build 2 "Bottle o' Features"

REM Last saved position of the Player's Character.
:LAST_LOCAL
IF %LL% == WP (
    GOTO :WindhelmPlaza
) ELSE IF %LL% == RWP (
    GOTO :RWP
) ELSE IF %LL% == WSQ (
    GOTO :WSQ
) ELSE IF %LL% == WHQ (
    GOTO :WHQec
) ELSE IF %LL% == WMQ (
    GOTO :WMQec
) ELSE IF %LL% == WFG (
    GOTO :WFG
) ELSE (
    REM LastLocal error.
    SET errorType=LastLocal
    ECHO LastLocal Error - corrupted or modified save file possible. >> ExplorationEngine.log
    CALL "%cd%\data\functions\Error Handler.bat"
    EXIT /B
)

REM The Player's starting location, and likely where they'll spend most of their time.
REM All other locations are accessed from the Windhelm Castle Plaza.
:WindhelmPlaza
SET LL=WP
CLS
ECHO.
ECHO TYPE command here
ECHO.
ECHO Where would you like to go?
ECHO %displayMessage%
ECHO =====================================================================================================
ECHO [1 / Windhelm Southern Gate ] ^| [2 / Rockwinn Plaza ] ^|[3 / Windhelm High Quarter ] ^| [E / EXIT]
ECHO [4 / Windhelm Mud Quarter ]   ^| [5 / Leave Windhelm ]
CHOICE /C 12345E /N /M ">"
IF ERRORLEVEL 6 GOTO :EOF
IF ERRORLEVEL 5 GOTO :WFG
IF ERRORLEVEL 4 GOTO :WMQ
IF ERRORLEVEL 3 GOTO :WHQ
IF ERRORLEVEL 2 GOTO :RWP
IF ERRORLEVEL 1 GOTO :WSG

REM Windhelm High Quarter. Contains the following interactable NPCs:
REM Wizard, Clarke Blackwell (recruitable NPC)
:WHQ
SET LL=WHQ
REM Call the script that handles this location and it's NPCs.
CALL "%cd%\data\Exploration Engine\Cells\Windhelm High Quarter\WHQ.bat"
GOTO :%LL%

:RWP
SET LL=RWP
REM Call the script that handles this location and it's NPCs.
CALL "%cd%\data\Exploration Engine\Cells\Rockwinn Plaza\RWP.bat"
REM Since this is a Quick Access location, an RTW check is required.
IF %LL% == RTW (
    GOTO :EOF
) ELSE (
    GOTO :%LL%
)

REM Movement check for WSG, chance to encounter enemies or NPCs when moving.
REM This area is contained within the Windhelm Castle, there is (0%) chance to encounter enemies or NPCs.
:WSG
SET LL=WSG
REM Call the script that handles this location and it's NPCs.
CALL "%cd%\data\functions\Exploration Engine\Locations\Windhelm Southern Gate\WSG.bat"
GOTO :%LL%

REM Movement check for WMQ, chance to encounter enemies or NPCs when moving.
REM This area is contained within the Windhelm Castle, there is a (0%) chance to encounter enemies or NPCs.
:WMQ
CALL "%cd%\data\functions\Exploration Engine\Locations\Windhelm Mud Quarter.WMQ.bat"
GOTO :%LL%

REM Leaves the walls of the Windhelm Castle, allowing the Player to move to other cells.
REM The Castle Gates area does not contain enemies.
:WFG
SET LL=WFG
CLS
ECHO.
ECHO TYPE command here
ECHO.
ECHO Where would you like to go?
ECHO %displayMessage%
ECHO =====================================================================================================
ECHO [1 / ENTER WINDHELM ] ^| [2 / IRIDESCENT FOREST ] ^| [E / EXIT]
CHOICE /C 12E /N /M ">"
IF ERRORLEVEL 3 GOTO :EOF
IF ERRORLEVEL 2 GOTO :IDF
IF ERRORLEVEL 1 GOTO :WindhelmPlaza

REM Enters the "Iridescent Forest" cell, allowing exploration.
:IDF
CALL "%cd%\data\Exploration Engine\Cells\Iridescent Forest\Chunk1.bat"
GOTO :EOF