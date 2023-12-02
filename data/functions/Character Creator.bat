@ECHO OFF
TITLE Windhelm - Character Creation
REM Character Creator v1.2.1 (231127) for Build 2 "Bottle o' Features"

REM Does Player data already exist? If so, overwrite it?
IF EXIST "%cd%\data\player\Player Stats.txt" (
    GOTO :overwrite_saveQ
) ELSE (
    GOTO :ENTER_NAME
)

:overwrite_saveQ
CLS
ECHO.
TYPE "%cd%\data\ascii\menus\overwrite_save.txt"
ECHO.
ECHO.
ECHO                                           Do you wish to overwrite an existing save?
ECHO +----------------------------------------------------------------------------------------------------------------------+
ECHO +----------------------------------------------------------------------------------------------------------------------+
CHOICE /C YN /N /M "Y/N"
IF ERRORLEVEL 2 GOTO :DNO
IF ERRORLEVEL 1 GOTO :ENTER_NAME

:DNO
SET initTrue=0
GOTO :EOF

:ENTER_NAME
SET initTrue=1
CLS
ECHO.
TYPE "%cd%\data\ascii\menus\your_name.txt"
ECHO.
ECHO.
ECHO                                          Do you recall your name, Shard?
ECHO +----------------------------------------------------------------------------------------------------------------------+
ECHO +----------------------------------------------------------------------------------------------------------------------+
SET /P player_name=
GOTO :CHOOSE_CLASS

:CHOOSE_CLASS
SET SLOPr=INIT
CLS
ECHO.
TYPE "%cd%\data\ascii\menus\your_class.txt"
ECHO                                          Choose a class for your Character.
ECHO +----------------------------------------------------------------------------------------------------------------------+
ECHO + [S] Mage : Magicka +50, Stamina -50, +10 Magicka Tonics, -2 magicka skill cost.
ECHO + [W] Warrior  : Health +60, Magicka -70, +5 Healing Tonics, -5 damage skill cost.
ECHO + [D] Druid : All attacks deal EARTH element damage, Health -30, Magicka +100, +5 Magicka tonics. -2 Magicka skill cost.
ECHO +----------------------------------------------------------------------------------------------------------------------+
CHOICE /C SWD /N /M ">"
IF ERRORLEVEL 3 GOTO :DRUID_CHOSEN
IF ERRORLEVEL 2 GOTO :WARRIOR_CHOSEN
IF ERRORLEVEL 1 GOTO :SORCERER_CHOSEN
GOTO :CHOOSE_CLASS

:DRUID_CHOSEN
SET HP=70
SET MAGICKA=200
SET /A magickaT_q=!magickaT_q! +5
SET player_class=Druid
SET MAGICKAMAX=200
SET HPMAX=70
CALL "%cd%\data\functions\SLOP.bat"
GOTO :EOF

:WARRIOR_CHOSEN
SET HP=160
SET MAGICKA=30
SET /A healingT_q=!healingT_q! +5
SET player_class=Warrior
SET MAGICKAMAX=30
SET HPMAX=160
CALL "%cd%\data\functions\SLOP.bat"
GOTO :EOF

:SORCERER_CHOSEN
SET player_class=Mage
SET MAGICKAMAX=150
SET STAMINAMAX=50
SET MAGICKA=150
SET STAMINA=50
SET /A magickaT_q=!magickaT_q! +10
CALL "%cd%\data\functions\SLOP.bat"
GOTO :EOF