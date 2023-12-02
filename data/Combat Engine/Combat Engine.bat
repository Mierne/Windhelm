@ECHO OFF
TITLE Combat Engine 7 - "Battle for Itor"
REM Combat Engine 7 (v7.0 231201) - Combat Engine for Build 2 "Bottle o' Features"

REM Set enemy names with the location identifier and set the schrodinger's variables.
SET curEn=%currentEnemy%
IF %curEn% == iBandit (
    SET enHP=%iBanditHP%
    SET enAT=%iBanditAT%
    SET enATb=%iBanditAT_b%
    SET enWK=%iBanditWK%
    SET curEn=Bandit
    GOTO :EBS
) ELSE IF %curEn% == iJester (
    SET enHP=%iJesterHP%
    SET enAT=%iJesterAT%
    SET enATb=%iJesterAT_b%
    SET enWK=%iJesterWK%
    SET curEn=Jester
    GOTO :EBS
) ELSE IF %curEn% == iGnome (
    SET enHP=%iGnomeHP%
    SET enAT=%iGnomeAT%
    SET enATb=%iGnomeAT_b%
    SET enWK=%iGnomeWK%
    SET curEn=Gnome
    GOTO :EBS
) ELSE IF %curEn% == iHunter (
    SET enHP=%iHunterHP%
    SET enAT=%iHunterAT%
    SET enATb=%iHunterAT_b%
    SET enWK=%iHunterWK%
    SET curEn=Hunter
    GOTO :EBS
) ELSE IF %curEn% == iGoblin (
    SET enHP=%iGoblinHP%
    SET enAT=%iGoblinAT%
    SET enATb=%iGoblinAT_b%
    SET enWK=%iGoblinWK%
    SET curEn=Goblin
    GOTO :EBS
) ELSE (
    REM Error handling.
    ECHO Enemy type unavailable. >> ERROR.log
    SET errorType=EnemyType
    CALL "%cd%\data\functions\Error Handler.bat"
    EXIT /B
)

REM Enemy Battle Screen. This is the modular part I talked about. btw.
:EBS
TITLE CE v7 - %curEn% VS. %player_name% ^| %player_class%
REM Reset the attack value after armor calculation to prevent negative damage values.
SET enAT=%enATb%
REM Win/Lose check.
IF %enHP% LEQ 0 GOTO :check_achievement 
IF %HP% LEQ 0 GOTO :defeat
REM Clear the screen.
CLS
REM Write the data from the text file to the CLI.
TYPE "%cd%\data\ascii\enemies\%curEn%.txt"
ECHO.
ECHO +--------------------------------------------------------------------------------------------------+
ECHO ^|                             HP: %enHP% ^| ATK: %enAT% ^| RES WKN: %enWK%
ECHO ^| %displayMessage%
ECHO +--------------------------------------------------------------------------------------------------+
ECHO ^| HP: %HP% ^| AP: %pAP%
ECHO ^| ATK %player_damage% ^| STM %stamina% ^| ARM: %armor_equip%
ECHO ^| %PM1name%: %PM1HP% ^| %PM2name%: %PM2HP% ^| %PM3name%: %PM3HP%
ECHO ^| %PM1name% ATK: %PM1ATK% ^| %PM2name% ATK: %PM2ATK% ^| %PM3ATK% ATK: %PM3ATK%
ECHO ^| %plrMessage%
ECHO +--------------------------------------------------------------------------------------------------+
ECHO ^| [I] ITEMS  ^| [S] Skip    ^|                                                                       +
ECHO ^|            ^|             ^|                                                                       +
ECHO ^| [A] ATTACK ^| [F] FLEE    ^|                                                                       +
ECHO +--------------------------------------------------------------------------------------------------+
CHOICE /C IASF /N /M ">"
IF ERRORLEVEL 4 GOTO :flee_chance
IF ERRORLEVEL 3 GOTO :armor_calculation
IF ERRORLEVEL 2 GOTO :player_attack_calculation
IF ERRORLEVEL 1 GOTO :gINV

REM Combat Engine v6 Koritsu combined damage calcuation system.
REM Could probably make the shield calculations their own function to prevent having to paste the same string twice.

:player_attack_calculation
REM Modifies stamina consumption based on the shield and weapon combo equipped.
REM Find the equipped shield
IF %shd_e% == BronzeBuckler (
    REM Find the equipped weapon
    IF %wpn_e% == ShortSword (
        REM Stamina check
        IF %stamina% LSS %shortsword_s% +8 (
            REM Not enough stamina
            SET plrMessage=Your stamina is too low!
            GOTO :EBS
        ) ELSE (
            REM Damage calculation.
            SET /A stamina=!stamina! -%stamina_equip%
            SET /A stamina=!stamina! +8
            GOTO :player_attack_commit
        )
    ) ELSE (
        REM Weapon set incorrect, do not apply buff. Skip to Damage calculation.
        GOTO :player_attack_commit
    )
) ELSE IF %shd_e% == KiteShield (
    REM Find the equipped weapon
    IF %wpn_e% == LongSword (
        REM Stamina check
        IF %stamina% LSS %longsword_s% +4 (
            REM Not enough stamina
            SET plrMessage=Your stamina is too low!
            GOTO :EBS
        ) ELSE (
            REM Apply buff, goto Damage calculation.
            SET /A stamina=!stamina! -%stamina_equip%
            SET /A stamina=!stamina! +4
            GOTO :player_attack_commit
        )
    ) ELSE (
        REM Weapon set incorrect, do not apply buff. Skip to Damage calculation.
        GOTO :player_attack_commit
    )
) ELSE (
    REM No shield equipped.
    SET /A stamina=!stamina! -%stamina_equip%
    GOTO :player_attack_commit
)

:player_attack_commit
SET /A PATT=%RANDOM% %%20
IF %PATT% GTR 17 (
    REM Modifies enemy "enHP" variable with a x2 multiplier.
    SET /A enHP=!enHP! -%player_damage%*%damage_skill%*2
    REM Display the following message in the "plrMessage" space.
    SET plrMessage=Critical hit on the %currentEnemy%!
    GOTO :armor_calculation
) ELSE IF %PATT% LSS 5 (
    REM Player attack misses.
    SET plrMessage=The %currentEnemy% dodged your attack!
    GOTO :armor_calculation
) ELSE (
     REM Modifies enemy "enHP" variable.
    SET /A enHP=!enHP! -%player_damage%*%damage_skill%
    REM Display the following message in the "plrMessage" space.
    SET plrMessage=You hit the %currentEnemy%!
    GOTO :armor_calculation
)

:armor_calculation
IF %weapon_type% == Ranged (
    SET attack_type=Ranged
) ELSE (
    set attack_type=Melee
)
IF %armorCalculated% GTR 0 (
    GOTO :enemy_attack_calculation
) ELSE (
    IF %armor_equip% GTR 0 (
        SET /A enAT=!enAT! -%armor_equip%-%armorSkill%
        SET armorCalculated=1
        GOTO :enemy_attack_calculation
    ) ELSE (
        GOTO :enemy_attack_calculation
    )
)

:enemy_attack_calculation
SET /A enAT=!enAT! +%armor_equip%+%armorSkill%
SET /A AAT=%RANDOM% %%20
IF %attack_type% == Ranged (
    SET /A AAT=!AAT! -3
)
IF %AAT% GTR 17 (
    SET /A hp=!hp! -%enAT%*2
    SET displayMessage=The %currentEnemy% got a crit!
    GOTO :EBS
) ELSE IF %AAT% LSS 5 (
    SET displayMessage=The %currentEnemy% narrowly missed!
    GOTO :EBS
) ELSE (
    SET /A hp=!hp! -%enAT%
    SET displayMessage=The %currentEnemy% hit you!
    GOTO :EBS
)

REM Chance based escape.
:flee_chance
SET /A FC=%RANDOM% %%5
IF %FC% EQU 5 (
    IF %hp% GTR 70 (
        REM Check success!
        GOTO :EOF
    ) ELSE (
        REM Check failure!
        SET plrMessage=Your attempt to escape failed!
        GOTO :%curEn%
    )
) ELSE IF %FC% EQU 4 (
    IF %hp% GTR 50 (
        REM Check success!
        GOTO :EOF
    ) ELSE (
        REM Check failure!
        SET plrMessage=Your attempt to escape failed!
        GOTO :%curEn%
    )
) ELSE IF %FC% EQU 3 (
    IF %hp% GTR 30 (
        REM Check success!
        GOTO :EOF
    ) ELSE (
        REM Check failure!
        SET plrMessage=Your attempt to escape failed!
        GOTO :%curEn%
    )
) ELSE IF %FC% EQU 2 (
    IF %hp% GTR 10 (
        REM Check success!
        GOTO :EOF
    ) ELSE (
        REM Check failure!
        SET plrMessage=Your attempt to escape failed!
        GOTO :%curEn%
    )
) ELSE (
    REM General failure!
    SET plrMessage=Your attempt to escape failed!
    GOTO :%curEn%
)

REM Check if the player has the "Defeat the(a)" enemy achievement.
:check_achievement
IF %defeat_bandit_achievement% EQU 0 (
    SET defeat_bandit_achievement=1
    SET plrMessage=Achievement Get. Get Back Here! - Defeat a Bandit.
    GOTO :victory
) ELSE (
    GOTO :victory
)

:ijac
IF %defeat_jester_achievement% EQU 0 (
    SET defeat_jester_achievement=1
    SET plrMessage=Achievement Get. Not so funny! - Defeat a Jester.
    GOTO :victory
) ELSE (
    GOTO :victory
)

:igac
IF %defeat_gnome_achievement% EQU 0 (
    SET defeat_gnome_achievement=1
    SET plrMessage=Achievement Get. Handle with care! - Defeat a Gnome.
    GOTO :victory
) ELSE (
    GOTO :victory
)

:ihac
IF %defeat_hunter_achievement% EQU 0 (
    SET defeat_hunter_achievement=1
    SET plrMessage=Achievement Get. Mutton, chopped! - Defeat a Hunter.
    GOTO :victory
) ELSE (
    GOTO :victory
)

REM GLOBAL VICTORY / DEFEAT MENUS
:victory
REM Reset Health & Stamina, set displayMessage.
SET hp=100
SET stamina=100
SET displayMessage=Defeated a: %curEn%. Replenished HP and Stamina.
CLS
ECHO.
TYPE "%cd%\data\ascii\menus\victory.txt"
ECHO.
ECHO %displayMessage%
ECHO +--------------------------------------------------------------------------------------------------+
ECHO ^| HP: %hp% ^| ATK %player_damage% ^| STM %stamina% ^| ARM: %armor_equip%
ECHO ^| %plrMessage%
ECHO ====================================================================================================
ECHO [1] Loot %curEn% ^| [E] EXIT
CHOICE /C 1E /N /M ">"
IF ERRORLEVEL 2 GOTO :RESET_LOOT
IF ERRORLEVEL 1 GOTO :LOOTING

REM Calls the looting script.
:LOOTING
CALL "%cd%\data\functions\Combat Engine\ceLoot.bat"
GOTO :victory

:defeat
REM Reset Health & Stamina, set displayMessage.
SET displayMessage=Defeated by: %curEn%, HP and Stamina not replenished.
IF %hp% LSS 0 (
    REM Prevent negative HP values.
    SET hp=0
)
CLS
ECHO.
TYPE "%cd%\data\ascii\menus\defeat.txt"
ECHO.
ECHO %displayMessage%
ECHO +--------------------------------------------------------------------------------------------------+
ECHO + HP: %hp% ^| ATK %player_damage% ^| STM %stamina% ^| ARM: %armor_equip%
ECHO + %plrMessage%
ECHO +--------------------------------------------------------------------------------------------------+
ECHO [E] EXIT
CHOICE /C E /N /M ">"
IF ERRORLEVEL 1 GOTO :EOF

REM Resets the Enemy Looted variable.
:RESET_LOOT
SET enLooted=0
GOTO :EOF