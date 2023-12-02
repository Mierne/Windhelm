@ECHO OFF
TITLE Windhelm ^| Exploration Engine ^| Name: %player_name% ^| Class: %player_class%
REM Exploration Engine v1 (231201)
REM --

REM Where was the Player last at when the game was saved?
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
    REM error
    GOTO :EOF
)

REM The "main" area, can access each zone which is attached to this location.
REM Attached zones are: Rockwinn Plaza, Windhelm Southern Gate, Windhlem High Quarter.
:WindhelmPlaza
SET LL=WP
CLS
ECHO.
ECHO TYPE command here
ECHO.
ECHO Where would you like to go?
ECHO %displayMessage%
ECHO =====================================================================================================
ECHO [1 / Windhelm Southern Gate ] ^| [2 / Rockwinn Plaza ] ^|[3 / Windhelm High Quater ] ^| [E / EXIT]
ECHO [4 / Windhelm Mud Quarter ]   ^| [5 / Leave Windhelm ]
CHOICE /C 12345E /N /M ">"
IF ERRORLEVEL 6 GOTO :EOF
IF ERRORLEVEL 5 GOTO :WFG
IF ERRORLEVEL 4 GOTO :WMQec
IF ERRORLEVEL 3 GOTO :WHQec
IF ERRORLEVEL 2 GOTO :RWPec
IF ERRORLEVEL 1 GOTO :WSGec

REM Movement check for WHQ, chance to encounter enemies or NPCs when moving.
REM This area is contained within the Windhelm Castle, there is (0%) chance to encounter enemies or NPCs.
:WHQec
GOTO :WHQ

REM Windhelm High Quater. Contains the following interactable NPCs:
REM Wizard, Clarke Blackwell (recruitable NPC)
:WHQ
SET LL=WHQ
REM Call the script that handles this location and it's NPCs.
CALL "%cd%\data\functions\Exploration Engine\Locations\Windhelm High Quarter\WHQ.bat"
GOTO :%LL%

REM Movement check for RWP, chance to encounter enemies or NPCs when moving.
REM This area is contained within the Windhelm Castle, there is (0%) chance to encounter enemies or NPCs.
:RWPec
GOTO :RWP

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
:WSGec
SET LL=WSG
REM Call the script that handles this location and it's NPCs.
CALL "%cd%\data\functions\Exploration Engine\Locations\Windhelm Southern Gate\WSG.bat"
GOTO :%LL%

REM Movement check for WMQ, chance to encounter enemies or NPCs when moving.
REM This area is contained within the Windhelm Castle, there is a (0%) chance to encounter enemies or NPCs.
:WMQec
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
CALL "%cd%\data\functions\Exploration Engine\Cells\Iridescent Forest\Chunk1.bat"
GOTO :EOF