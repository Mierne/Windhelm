@ECHO OFF
TITLE WINDHELM - SETTINGS
REM Settings script, not much going on here.

:main
CLS
type                                       data\ascii\menus\SETTINGS.txt
echo.
echo.
echo.
echo ========================================================================================================================
echo [1] CHANGE THEME ^| [E] EXIT
CHOICE /C 1E /N /M ">"
IF ERRORLEVEL 2 GOTO :save_choice
IF ERRORLEVEL 1 GOTO :theme_select

REM CHANGE BACKGROUND & TEXT COLOR.
:theme_select
CLS
type                                       data\ascii\menus\COLOR.txt
echo.
echo.
echo.
echo Select from the presets below or enter a valid Batch Script color code.
echo ========================================================================================================================
echo %displayMessage%
echo [1] 0E (DEFAULT) ^| [2] 1F (HIGH VIS) ^| [3] 09 ^| [4] 0A ^| [5] 0F ^| [C] Custom ^|  ^| [E] EXIT
CHOICE /C 12345CE /N /M ">"
IF ERRORLEVEl 7 GOTO :main
IF ERRORLEVEL 6 GOTO :custom_color
IF ERRORLEVEL 5 GOTO :0F
IF ERRORLEVEL 4 GOTO :0A
IF ERRORLEVEL 3 GOTO :09
IF ERRORLEVEL 2 GOTO :1F
IF ERRORLEVEL 1 GOTO :0E

:custom_color
CLS
type                                       data\ascii\menus\COLOR.txt
echo.
echo.
echo Enter a valid Batch Script color code.
echo ========================================================================================================================
echo %displayMessage%
ECHO [E] EXIT
SET /P custom=^>
COLOR %custom%
SET setColor=%custom%
SET displayMessage=%cusom% applied; exit this menu to apply.
IF /I "%A%" == "E" GOTO "save_choice
GOTO :theme_select

:0E
set setColor=0E
color 0E
set displayMessage=Color 0E applied; exit to save this choice.
GOTO :theme_select

:0F
set setColor=0F
color 0F
set displayMessage=Color 0F applied; exit to save this choice.
GOTO :theme_select

:09
set setColor=09
color 09
set displayMessage=Color 09 applied; exit to save this choice.
GOTO :theme_select

:0A
set setColor=0A
color 0A
set displayMessage=Color 0A applied; exit to save this choice.
GOTO :theme_select

:1F
set setColor=1F
COLOR 1F
set displayMessage=Color 1F applied; exit to save this choice.
GOTO :theme_select

:save_choice
(
ECHO %setColor%
)>data\settings.txt
GOTO :EOF