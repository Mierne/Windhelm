@ECHO OFF
TITLE (Windhelm Castle) Rockwinn Plaza - Alchemist ^| %player_name% the %player_class%
REM Alchemist Merchant. v1 231217

REM Main Menu for the Alchemist, access each sub-shop here.
:MAIN_MENU
CLS
ECHO.
ECHO                                               Kin'Næi
ECHO                   Your kind are... rare. Something to ease the pain, I presume?
ECHO.
ECHO COINS: %coins% ^| AFFINITY: %player_affinity_alchemist%
ECHO %displayMessage%
ECHO ========================================================================================================================
ECHO [1 / TONICS ] ^| [2 / INGREDIENTS ] ^| [T / TALK ] ^| [S / SELL ] ^| [E / LEAVE ]
CHOICE /C 12TSE /N /M ">"
IF ERRORLEVEL 5 GOTO :EOF
IF ERRORLEVEL 4 GOTO :SELL_ITEMS
IF ERRORLEVEL 3 GOTO :ALCHEMIST_DIALOGUE
IF ERRORLEVEL 2 GOTO :BUY_INGREDIENTS
IF ERRORLEVEL 1 GOTO :BUY_TONICS

REM Alchemist Tonic Shop.
:BUY_TONICS
REM If Affinity level is higher than 1, enable discounts.
IF %player_affinity_alchemist% GEQ 400 (
    SET alcDA=1
) ELSE (
    SET alcDA=0
)
CLS
ECHO type command goes here.
ECHO +--------------------------------------------------------------------------------------------------+
ECHO ^|                             Hm. Take a look, I have what you seek.                                +
ECHO ^| %displayMessage%
ECHO +--------------------------------------------------------------------------------------------------+
ECHO + STATUS: %player_effect_1% , %player_effect_2%
ECHO +--------------------------------------------------------------------------------------------------+
ECHO ^| COINS: %coins% ^| AFFINITY: %player_affinity_alchemist%
ECHO +--------------------------------------------------------------------------------------------------+
ECHO +                                          ITEM STOCK                                                +
ECHO +--------------------------------------------------------------------------------------------------+
ECHO ^| HEALING TONIC: %hTonic_s%, PRICE: %hTonic_p%
ECHO ^| STAMINA TONIC: %sTonic_s%, PRICE: %sTonic_p%
ECHO ^| MAGICKA TONIC: %mTonic_s%, PRICE: %mTonic_p%
ECHO +--------------------------------------------------------------------------------------------------+
ECHO + [1 / HEALING TONIC ] ^| [2 / STAMINA TONIC ] ^| [3 / MAGICKA TONIC ] ^| [E / BACK ]                +
ECHO +--------------------------------------------------------------------------------------------------+
CHOICE /C 123E /N /M ">"
IF ERRORLEVEL 4 GOTO :MAIN_MENU
IF ERRORLEVEL 3 GOTO :BUY_MAGICKA_TONIC
IF ERRORLEVEL 2 GOTO :BUY_STAMINA_TONIC
IF ERRORLEVEL 1 GOTO :BUY_HEALING_TONIC

REM Purchase Healing Tonic Logic.
:BUY_HEALING_TONIC
REM Check if Discounts are active.
IF %alcDA% EQU 1 (
    REM Check if the Player can afford the item.
    IF %coins% LSS 20 (
        REM The Player cannot afford this item.
        SET displayMessage=No can do little Shard, you must pay...
        GOTO :BUY_TONICS
    ) ELSE (
        REM Take the coins, remove [1] of the item from the Alchemist's stock and give [1] of the item to the Player.
        SET /A %coins%=!coins! -%hTonic_p%
        REM Apply the Discount.
        SET /A %coins%=!coins! +%hTonic_affinityleveltwo_d%
        REM Remove [1] of this item from the Merchant's stock.
        SET /A %hTonic_s%=hTonic_s -1
        REM Add [1] of this item to the Player's inventory.
        SET /A %healingT_q%=!healingT_q! +1
        SET displayMessage=Purchased 1 Healing Tonic for 20 coins.
        GOTO :BUY_TONICS
    )
) ELSE (
    REM Check if the Player can afford the item.
    IF %coins% LSS 25 (
        REM The Player cannot afford this item.
        SET displayMessage=No can do little Shard, you must pay...
        GOTO :BUY_TONICS
    ) ELSE (
        REM Take the coins, remove [1] of the item from the Alchemist's stock and give [1] of the item to the Player.
        SET /A %coins%=!coins! -25
        REM Remove [1] of this item from the Merchant's stock.
        SET /A %hTonic_s%=!hTonic_s! -1
        REM Add [1] of this item to the Player's inventory.
        SET /A %healingT_q%=!healingT_q! +1
        SET displayMessage=Purchased 1 Healing Tonic for 25 coins.
        GOTO :BUY_TONICS
    )
)

REM Purchase Stamina Tonic Logic.
:BUY_STAMINA_TONIC
REM Check if Discounts are active.
IF %alcDA% EQU 1 (
    REM Check if the Player can afford the item.
    IF %coins% LSS 20 (
        REM The Player cannot afford this item.
        SET displayMessage=No can do little Shard, you must pay...
        GOTO :BUY_TONICS
    ) ELSE (
        REM Take the coins, remove [1] of the item from the Alchemist's stock and give [1] of the item to the Player.
        SET /A %coins%=!coins! -%sTonic_p%
        REM Apply the Discount.
        SET /A %coins%=!coins! +%sTonic_affinityleveltwo_d%
        REM Remove [1] of this item from the Merchant's stock.
        SET /A %sTonic_s%=sTonic_s -1
        REM Add [1] of this item to the Player's inventory.
        SET /A %staminaT_q%=!staminaT_q! +1
        SET displayMessage=Purchased 1 Stamaina Tonic for 20 coins.
        GOTO :BUY_TONICS
    )
) ELSE (
    REM Check if the Player can afford the item.
    IF %coins% LSS 25 (
        REM The Player cannot afford this item.
        SET displayMessage=No can do little Shard, you must pay...
        GOTO :BUY_TONICS
    ) ELSE (
        REM Take the coins, remove [1] of the item from the Alchemist's stock and give [1] of the item to the Player.
        SET /A %coins%=!coins! -25
        REM Remove [1] of this item from the Merchant's stock.
        SET /A %sTonic_p%=!sTonic_p! -1
        REM Add [1] of this item to the Player's inventory.
        SET /A %staminaT_q%=!staminaT_q! +1
        SET displayMessage=Purchased 1 Stamina Tonic for 25 coins.
        GOTO :BUY_TONICS
    )
)

REM Purchase Magicka Tonic Logic.
:BUY_MAGICKA_TONIC
REM Check if Discounts are active.
IF %alcDA% EQU 1 (
    REM Check if the Player can afford the item.
    IF %coins% LSS 20 (
        REM The Player cannot afford this item.
        SET displayMessage=No can do little Shard, you must pay...
        GOTO :BUY_TONICS
    ) ELSE (
        REM Take the coins, remove [1] of the item from the Alchemist's stock and give [1] of the item to the Player.
        SET /A %coins%=!coins! -%mTonic_p%
        REM Apply the Discount.
        SET /A %coins%=!coins! +%mTonic_affinityleveltwo_d%
        REM Remove [1] of this item from the Merchant's stock.
        SET /A %mTonic_s%=mTonic_s -1
        REM Add [1] of this item to the Player's inventory.
        SET /A %magickaT_q%=!magickaT_q! +1
        SET displayMessage=Purchased 1 Magicka Tonic for 20 coins.
        GOTO :BUY_TONICS
    )
) ELSE (
    REM Check if the Player can afford the item.
    IF %coins% LSS 25 (
        REM The Player cannot afford this item.
        SET displayMessage=No can do little Shard, you must pay...
        GOTO :BUY_TONICS
    ) ELSE (
        REM Take the coins, remove [1] of the item from the Alchemist's stock and give [1] of the item to the Player.
        SET /A %coins%=!coins! -25
        REM Remove [1] of this item from the Merchant's stock.
        SET /A %mTonic_s%=!mTonic_s! -1
        REM Add [1] of this item to the Player's inventory.
        SET /A %magickaT_q%=!magickaT_q! +1
        SET displayMessage=Purchased 1 Magicka Tonic for 25 coins.
        GOTO :BUY_TONICS
    )
)