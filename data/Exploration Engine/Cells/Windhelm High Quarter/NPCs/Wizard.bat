@ECHO OFF
TITLE WINDHELM PLAZA - THE WIZARD (J'ZAR ALMANI)
REM Plaza v1.1b (Autumn Awakening)

REM Variables

:dash
CLS
ECHO.
ECHO                                         J'ZAR ALMANI
ECHO                     I've many tonics.. Or perhaps scrolls interest you more?
ECHO.
ECHO LEVELS: %LEVELS% ^| COINS: %COINS% ^| AFFINITY: %player_affinity_wizard%
ECHO %displayMessage%
ECHO ========================================================================================================================
ECHO [1] HEALTH TONIC ^| [2] STAMINA TONIC ^| [3] WEAKEN TONIC ^| [4] SKILL POINTS
ECHO     125 COINS    ^|     500 COINS     ^|     1025         ^|     350 COINS
ECHO                             [S] SELL ^| [E] LEAVE
CHOICE /C 1234SE /N /M ">"
IF ERRORLEVEL 6 GOTO :EOF
IF ERRORLEVEL 5 GOTO :sellTonics
IF ERRORLEVEL 4 GOTO :skillPoints
IF ERRORLEVEL 3 GOTO :buyWeakenTonic
IF ERRORLEVEL 2 GOTO :buyStaminaTonic
IF ERRORLEVEL 1 GOTO :buyHealthTonic

:buyHealthTonic
IF %COINS% LSS 125 (
    GOTO :noCoins
) ELSE (
    SET /A healingTONIC=!healingTONIC! +1
    SET /A COINS=!COINS! -125
    SET displayMessage=Purchased [1] Healing Tonic for 125 coins.
    GOTO :dash
)

:buyStaminaTonic
IF %COINS% LSS 500 (
    GOTO :noCoins
) ELSE (
    SET /A staminaTONIC=!staminaTONIC! +1
    SET /A COINS=!COINS! -500
    SET displayMessage=Purchased [1] Stamina Tonic for 500 coins.
    GOTO :dash
)

:buyWeakenTonic
IF %COINS% LSS 1025 (
    GOTO :noCoins
) ELSE (
    SET /A weakenTONIC=!weakenTONIC! +1
    SET /A COINS=!COINS! -1025
    SET displayMessage=Purchased [1] Weaken Tonic for 1025 coins.
    GOTO :dash
)

REM SKILL POINTS
:skillPoints
IF %LEVELS% LSS 0 (
    SET LEVELS=0
)
CLS
ECHO.
type data\TITLES\skills.txt
ECHO.
ECHO LEVELS: %LEVELS%
ECHO DAMAGE: %damageSkill% ^| STAMINA: %staminaSkill% ^| MAGICKA: %magickaSkill% ^| ARMOR: %armorSkill%
ECHO %displayMessage%
ECHO ========================================================================================================================
ECHO [1] ASSIGN DAMAGE ^| [2] ASSIGN STAMINA ^| [3] ASSIGN MAGICKA ^| [4] ASSIGN ARMOR
ECHO   +1 SKILL POINT  ^|   +1 SKILL POINT   ^|   +1 SKILL POINT   ^|   +1 SKILL POINT
ECHO   -20 LEVELS       ^|   -15 LEVELS       ^|   -5 LEVELS        ^|   -40 LEVELS
ECHO                                     ^| [E] EXIT
CHOICE /C 1234E /N /M ">"
IF ERRORLEVEL 5 GOTO :dash
IF ERRORLEVEL 4 GOTO :checkArmor
IF ERRORLEVEL 3 GOTO :checkMagicka
IF ERRORLEVEL 2 GOTO :checkStamina
IF ERRORLEVEL 1 GOTO :checkDamage

REM CHECK FOR CONFLICTS
:checkArmor
IF %damageSkill% EQU 4 (
    GOTO :maxLevel
) ELSE (
    IF %armorSkill% GEQ 3 (
        SET displayMessage=Skill limited by: Armor Skill.
        GOTO :skillPoints
    ) ELSE (
        GOTO :assignDamage
    )
)

:checkStamina
IF %staminaSkill% EQU 4 (
    GOTO :maxLevel
) ELSE (
    IF %magickaSkill% GEQ 5 (
        SET displayMessage=Skill limited by: Magicka Skill.
        GOTO :skillPoints
    ) ELSE (
        GOTO :assignStamina
    )
)

:checkArmor
IF %armorSkill% EQU 4 (
    GOTO :maxLevel
) ELSE (
    IF %damageSkill% GEQ 3 (
        SET displayMessage=Skill limited by: Damage Skill.
        GOTO :skillPoints
    ) ELSE (
        GOTO :assignArmor
    )
)

:checkMagicka
IF %magickaSkill% EQU 4 (
    GOTO :maxLevel
) ELSE (
    IF %staminaSkill% GEQ 3 (
        SET displayMessage=Skill limited by: Stamina Skill.
        GOTO :skillPoints
    ) ELSE (
        GOTO :assignMagicka
    )
)

REM ASSIGN SKILL POINTS
:assignDamage
IF %player_class% == Warrior (
    IF %LEVELS% LSS 15 (
        GOTO :noLevels
    ) ELSE (
        SET /A damageSkill=!damageSkill! +1
        SET /A LEVELS=!LEVELS! -15
        SET displayMessage=Damage skill increased by [1] for 15 levels (Class Discount)
        GOTO :skillPoints
    )
) ELSE (
    IF %LEVELS% LSS 20 (
        GOTO :noLevels
    ) ELSE (
        SET /A damageSkill=!damageSkill! +1
        SET /A LEVELS=!LEVELS! -20
        SET displayMessage=Damage skill increased by [1] for 20 levels.
        GOTO :skillPoints
    )
)

:assignStamina
IF %LEVELS% LSS 15 (
    GOTO :noLevels
) ELSE (
    SET /A staminaSkill=!staminaSkill! +1
    SET /A LEVELS=!LEVELS! -15
    SET displayMessage=Stamina skill increased by [1] for 15 levels.
    GOTO :skillPoints
)

:assignMagicka
IF %player_class% == Mage (
    IF %LEVELS% LSS 3 (
        GOTO :noLevels
    ) ELSE (
        SET /A damageSkill=!damageSkill! +1
        SET /A LEVELS=!LEVELS! -3
        SET displayMessage=Damage skill increased by [1] for 3 levels (Class Discount)
        GOTO :skillPoints
    )
) ELSE (
    IF %LEVELS% LSS 5 (
        GOTO :noLevels
    ) ELSE (
        SET /A damageSkill=!damageSkill! +1
        SET /A LEVELS=!LEVELS! -5
        SET displayMessage=Damage skill increased by [1] for 5 levels.
        GOTO :skillPoints
    )
)

:assignArmor
IF %LEVELS% LSS 40 (
    GOTO :noLevels
) ELSE (
    set /a armorSkill=!armorSkill! +1
    set /a LEVELS=!LEVELS! -40
    set displayMessage=Armor skill increased by [1] for 40 levels.
    GOTO :skillPoints
)

REM BUY
:sellTonics
CLS
echo.
echo                                         J'ZAR ALMANI
echo                  I have some spare shelf space, if you've got anything of interest...
echo.
echo LEVELS: %LEVELS% ^| COINS: %COINS% ^| AFFINITY: %pAffWizard%
echo %displayMessage%
echo ========================================================================================================================
echo [1] HEALTH TONIC ^| [2] STAMINA TONIC ^| [3] MAGICKA TONIC
echo     90 COINS    ^|     350 COINS     ^|     200 COINS
echo                         [E] EXIT
CHOICE /C 123E /N /M ">"
IF ERRORLEVEL 4 GOTO :dash
IF ERRORLEVEL 3 GOTO :sell_magicka_tonic
IF ERRORLEVEL 2 GOTO :sell_stamina_tonic
IF ERRORLEVEL 1 GOTO :sell_healing_tonic

REM Sell Healing Tonic.
:sell_healing_tonic
IF %healingT_q% EQU 0 (
    GOTO :no_item
) ELSE (
    IF %player_affinity_wizard% GEQ 400 (
        SET /A coins=!coins! +120
        SET /A healingT_q=!healingT_q! -1
        SET displayMessage=Sold Healing Tonic for 120, price modified by Affinity.
        GOTO :sellTonics
    ) ELSE (
        SET /A coins=!coins! +90
        SET /A healingT_q=!healingT_q! -1
        SET displayMessage=Sold Healing Tonic for 90 coins.
        GOTO :sellTonics
    )
)

REM Sell Stamina Tonic.
:sell_stamina_tonic
IF %staminaT_q% EQU 0 (
    GOTO :no_item
) ELSE (
    IF %player_affinity_wizard% GEQ 400 (
        SET /A coins=!coins! +375
        SET /A staminaT_q=!staminaT_q! -1
        SET displayMessage=Sold Stamina Tonic for 375, price modified by Affinity.
        GOTO :sellTonics
    ) ELSE (
        SET /A coins=!coins! +350
        SET /A staminaT_q=!staminaT_q! -1
        SET displayMessage=Sold Stamina Tonic for 350 coins.
        GOTO :sellTonics
    )
)

REM Sell Magicka Tonic.
:sell_magicka_tonic
IF %magickaT_q% EQU 0 (
    GOTO :no_item
) ELSE (
    IF %player_affinity_wizard% GEQ 400 (
        SET /A coins=!coins! +280
        SET /A magickaT_q=!magickaT_q! -1
        SET displayMessage=Sold Healing Tonic for 280, price modified by Affinity.
        GOTO :sellTonics
    ) ELSE (
        SET /A coins=!coins! +200
        SET /A magickaT_q=!magickaT_q! -1
        SET displayMessage=Sold Magicka Tonic for 200 coins.
        GOTO :sellTonics
    )
)

REM Not enough levels.
:noLevels
SET displayMessage=You do not have enough levels to increase this skill.
GOTO :skillPoints

REM Max level reached.
:maxLevel
SET displayMessage=Max level reached.
GOTO :skillPoints

REM Not enough coins.
:noCoins
SET displayMessage=You cannot afford this item.
GOTO :dash

REM You do not have the item to sell.
:no_item
SET displayMessage=You cannot sell something you don't have!
GOTO :dash

REM Wizard is not buying new items.
:not_buying
SET displayMessage=This item is not currently being purchased.
GOTO :dash

REM End of Script, return to Windhelm.
:EOS