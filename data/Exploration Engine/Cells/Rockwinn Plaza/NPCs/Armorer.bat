@ECHO OFF
TITLE (Rockwinn Plaza) - The Armorer ^| Name: %player_name% ^| Class: %player_class%
REM Armorer v2.0 231222 - For Windhelm Build 2 "Bottle 'o Features"

REM Main Menu, used to access submenus.
:MM
CLS
ECHO +--------------------------------------------------------------------------------------------------+
ECHO ^|                        Still hanging on to that mortal shell of yours?...                        +
ECHO ^| %displayMessage%
ECHO +--------------------------------------------------------------------------------------------------+
ECHO + erm idk what to put here teehee...
ECHO +--------------------------------------------------------------------------------------------------+
ECHO ^| COINS: %coins% ^| AFFINITY: %player_affinity_armorer%
ECHO +--------------------------------------------------------------------------------------------------+
ECHO +                                          ITEM STOCK                                                +
ECHO +--------------------------------------------------------------------------------------------------+
ECHO ^|  CACTUS ARMOR: %cactusArmor_s%, PRICE: %cactusArmor_p% ^| SCALED ARMOR: %scaledArmor_s%, PRICE: %scaledArmor_p% ^| SILVER ARMOR: %silverArmor_s%, PRICE: %silverArmor_p%
ECHO ^|  STONE ARMOR: %stoneArmor_s%, PRICE: %stoneArmor_p% ^| IRON ARMOR: %ironArmor_s%, PRICE: %ironArmor_p% ^| GOLD ARMOR: %goldArmor_s%, PRICE: %goldArmor_p%
ECHO ^|  STEEL ARMOR: %steelArmor_s%, PRICE: %steelArmor_p% ^| LEATHER ARMOR: %leatherArmor_s%, PRICE: %leatherArmor_p% 
ECHO +--------------------------------------------------------------------------------------------------+
ECHO + [1 / CACTUS ARMOR ] ^| [2 / STONE ARMOR ] ^| [3 / STEEL ARMOR ] ^| [4 / SCALED ARMOR ]
ECHO + [5 / IRON ARMOR ] ^| [6 / LEATHER ARMOR ] ^| [7 / SILVER ARMOR ] ^| [8 / GOLD ARMOR ]
ECHO + [E / EXIT ]
ECHO +--------------------------------------------------------------------------------------------------+
CHOICE /C 12345678E /N /M ">"
IF ERRORLEVEL 9 GOTO :EOF
IF ERRORLEVEL 8 GOTO :buy_gold_armor
IF ERRORLEVEL 7 GOTO :buy_silver_armor
IF ERRORLEVEL 6 GOTO :buy_leather_armor
IF ERRORLEVEL 5 GOTO :buy_iron_armor
IF ERRORLEVEL 4 GOTO :buy_scaled_armor
IF ERRORLEVEL 3 GOTO :buy_steel_armor
IF ERRORLEVEL 2 GOTO :buy_stone_armor
IF ERRORLEVEL 1 GOTO :buy_cactus_armor

REM Buy Cactus Armor store logic
:buy_cactus_armor
REM Check if the item is available.
IF %cactusArmor_s% EQU 0 (
    REM This item is out of stock.
    SET displayMessage=Afraid I'm out of that item at the moment.
    GOTO :MM
) ELSE (
    REM Check if the Player can afford this item.
    IF %coins% LSS %cactusArmor_p% (
        REM The Player cannot afford this item.
        SET displayMessage=Sorry, you can't afford this.
        GOTO :MM
    ) ELSE (
        REM Take [1] from the Merchant's stock, and add [1] to the Player's inventory, then deduct the price.
        SET /A coins=!coins! -%cactusArmor_p%
        SET /A cactusArmor_s=!cactusArmor_s! -1
        SET /A cactusA_q=!cactusA_q! +1
        SET displayMessage=Purchased 1 Cactus Armor for %cactusArmor_p%.
        GOTO :MM
    )
)