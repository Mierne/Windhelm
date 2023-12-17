if not defined in_subprocess (cmd /k set in_subprocess=y ^& %0 %*) & exit )
@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION
TITLE Windhelm - Main Menu
REM Set the size of the CLI Window.
MODE con: cols=120 lines=20

REM Read the settings file and apply the value to "setColor".
:settingsLoader
(
SET /P setColor=
)<data\settings.txt
GOTO :settingsApply

REM Change the "COLOR" to the saved value, and prevent "ECHO IS OFF" readback from displayMessage.
:settingsApply
COLOR %setColor%
SET displayMessage=...

REM Main Menu. Access settings, Continue & New Game from here.
:START
CLS
ECHO.
TYPE "%cd%\data\ascii\menus\main.txt"
ECHO.
ECHO.
ECHO Build 2 (231217) "Bottle o' Features"
ECHO Copyright (c) Mierne, 2023. All Rights Reserved.
ECHO ========================================================================================================================
ECHO                           [1 / CONTINUE ] ^| [2 / NEW GAME ] ^| [3 / SETTINGS ] ^| [E / EXIT ] 
ECHO.
CHOICE /C 123E /N /M ">"
IF ERRORLEVEL 4 GOTO :EOF
IF ERRORLEVEL 3 GOTO :settings
IF ERRORLEVEL 2 GOTO :NEW_GAME
IF ERRORLEVEL 1 GOTO :LOAD_SAVE

REM Launch the settings menu.
:settings
CALL "%cd%\data\functions\Settings.bat"
GOTO :START

REM Launch player creator - creates stats and inventory.
:NEW_GAME
CALL "%cd%\data\functions\Character Creator.bat"
GOTO :dashboard

REM Load Player save data.
:LOAD_SAVE
REM Check if a save even exists.
SET SLOPr=LOAD
IF NOT EXIST "%cd%\data\player\Player Stats.txt" (
    ECHO Player data not found - please make a new save.
    PAUSE
    GOTO :START
) ELSE (
    REM If the above check passes, call SLOP to load data.
    CALL "%cd%\data\functions\SLOP.bat"
    GOTO :dashboard
)

:dashboard
TITLE (WINDHELM) CASTLE GATE ^| NAME: %player_name% ^| CLASS: %player_class%
CLS
IF %LEVELS% LSS 0 SET LEVELS=0
IF %HP% LSS 0 set HP=0
ECHO.
TYPE "%cd%\data\ascii\menus\windhelm.txt"
ECHO.
ECHO.
ECHO                           A sheet white blanket of snow covers the rocky paths of the city.
ECHO +----------------------------------------------------------------------------------------------------------------------+
ECHO +                                 HP / %hp% ^| COINS / %coins% ^| ARMOR / %armor_equip% ^| LEVELS / %levels%
ECHO + %displayMessage%
ECHO +----------------------------------------------------------------------------------------------------------------------+
ECHO                   [1 / EXPLORE ] ^| [2 / INVENTORY ] ^| [3 / ROCKWINN PLAZA ] ^| [S / SAVE ] ^| [E / EXIT ]
CHOICE /C 123SE /N /M ">"
IF ERRORLEVEL 5 GOTO :Exit_Without_Saving
IF ERRORLEVEL 4 GOTO :Save_Game
IF ERRORLEVEL 3 GOTO :RWP
IF ERRORLEVEL 2 GOTO :view_inventory
IF ERRORLEVEL 1 GOTO :EE

REM Call the "Achievements Viewer" script.
:Achievements_Viewer
CALL "%cd%\data\functions\Achievements Viewer.bat"
GOTO :dashboard

REM "Exit without saving" screen.
:Exit_Without_Saving
ECHO Exit without saving? You will lose your progress.
CHOICE /C YN
IF ERRORLEVEL 2 GOTO :dashboard
IF ERRORLEVEL 1 GOTO :EOF

REM Call SLOP with a "SLOPr" of "SAVE".
:Save_Game
SET SLOPr=SAVE
CALL "%cd%\data\functions\SLOP.bat"
SET displayMessage=Your game was saved.
GOTO :dashboard

REM Call the Inventory Viewer script.
:view_inventory
CALL "%cd%\data\functions\Inventory Viewer.bat"
GOTO :dashboard

REM Bypass intial Exploration Engine menus and skip to the Rockwinn Plaza.
:RWP
SET LL=RWP
CALL "%cd%\data\Exploration Engine\Exploration Engine.bat"
GOTO :dashboard

REM Call the Exploration Engine.
:EE
CALL "%cd%\data\Exploration Engine\Exploration Engine.bat"
GOTO :dashboard