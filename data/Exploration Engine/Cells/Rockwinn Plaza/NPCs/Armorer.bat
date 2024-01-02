@ECHO OFF
TITLE (Rockwinn Plaza) - The Armorer ^| Name: %player_name% the %player_class%
REM Armorer v2.0 231223 - For Windhelm Build 2 "Bottle 'o Features"
REM Checks for Affinity come later, I can't be assed right now!!


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

REM Buy Cactus Armor store logic.
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

REM Buy Stone Armor store logic.
:buy_stone_armor
REM Check if the item is available.
IF %stoneArmor_s% EQU 0 (
    REM This item is out of stock.
    SET displayMessage=Afraid I'm out of that item at the moment.
    GOTO :MM
) ELSE (
    REM Check if the Player can afford this item.
    IF %coins% LSS %stoneArmor_p% (
        REM The Player cannot afford this item.
        SET displayMessage=Sorry, you can't afford this.
        GOTO :MM
    ) ELSE (
        REM Take [1] from the Merchant's stock, and add [1] to the Player's inventory, then deduct the price.
        SET /A coins=!coins! -%stoneArmor_p%
        SET /A stoneArmor_s=!stoneArmor_s! -1
        SET /A stoneA_q=!stoneA_q! +1
        SET displayMessage=Purchased 1 Stone Armor for %stoneArmor_p%.
        GOTO :MM
    )
)

REM Buy Steel Armor store logic.
:buy_steel_armor
REM Check if the item is available.
IF %steelArmor_s% EQU 0 (
    REM This item is out of stock.
    SET displayMessage=Afraid I'm out of that item at the moment.
    GOTO :MM
) ELSE (
    REM Check if the Player can afford this item.
    IF %coins% LSS %steelArmor_p% (
        REM The Player cannot afford this item.
        SET displayMessage=Sorry, you can't afford this.
        GOTO :MM
    ) ELSE (
        REM Take [1] from the Merchant's stock, and add [1] to the Player's inventory, then deduct the price.
        SET /A coins=!coins! -%steelArmor_p%
        SET /A steelArmor_s=!steelArmor_s! -1
        SET /A steelA_q=!steelA_q! +1
        SET displayMessage=Purchased 1 Steel Armor for %steelArmor_p%.
        GOTO :MM
    )
)

REM Buy Scaled Armor store logic.
:buy_scaled_armor
REM Check if the item is available.
IF %scaledArmor_s% EQU 0 (
    REM This item is out of stock.
    SET displayMessage=Afraid I'm out of that item at the moment.
    GOTO :MM
) ELSE (
    REM Check if the Player can afford this item.
    IF %coins% LSS %scaledArmor_p% (
        REM The Player cannot afford this item.
        SET displayMessage=Sorry, you can't afford this.
        GOTO :MM
    ) ELSE (
        REM Take [1] from the Merchant's stock, and add [1] to the Player's inventory, then deduct the price.
        SET /A coins=!coins! -%scaledArmor_p%
        SET /A scaledArmor_s=!scaledArmor_s! -1
        SET /A scaledA_q=!scaledA_q! +1
        SET displayMessage=Purchased 1 Scaled Armor for %scaledArmor_p%.
        GOTO :MM
    )
)

REM Buy Iron Armor store logic.
:buy_iron_armor
REM Check if the item is available.
IF %ironArmor_s% EQU 0 (
    REM This item is out of stock.
    SET displayMessage=Afraid I'm out of that item at the moment.
    GOTO :MM
) ELSE (
    REM Check if the Player can afford this item.
    IF %coins% LSS %ironArmor_p% (
        REM The Player cannot afford this item.
        SET displayMessage=Sorry, you can't afford this.
        GOTO :MM
    ) ELSE (
        REM Take [1] from the Merchant's stock, and add [1] to the Player's inventory, then deduct the price.
        SET /A coins=!coins! -%ironArmor_p%
        SET /A ironArmor_s=!ironArmor_s! -1
        SET /A ironA_q=!ironA_q! +1
        SET displayMessage=Purchased 1 Iron Armor for %ironArmor_p%.
        GOTO :MM
    )
)

REM Buy Leather Armor store logic.
:buy_leather_armor
REM Check if the item is available.
IF %leatherArmor_s% EQU 0 (
    REM This item is out of stock.
    SET displayMessage=Afraid I'm out of that item at the moment.
    GOTO :MM
) ELSE (
    REM Check if the Player can afford this item.
    IF %coins% LSS %leatherArmor_p% (
        REM The Player cannot afford this item.
        SET displayMessage=Sorry, you can't afford this.
        GOTO :MM
    ) ELSE (
        REM Take [1] from the Merchant's stock, and add [1] to the Player's inventory, then deduct the price.
        SET /A coins=!coins! -%leatherArmor_p%
        SET /A leatherArmor_s=!leatherArmor_s! -1
        SET /A leatherA_q=!leatherA_q! +1
        SET displayMessage=Purchased 1 Leather Armor for %leatherArmor_p%.
        GOTO :MM
    )
)

REM Buy Silver Armor store logic.
:buy_silver_armor
REM Check if the item is available.
IF %silverArmor_s% EQU 0 (
    REM This item is out of stock.
    SET displayMessage=Afraid I'm out of that item at the moment.
    GOTO :MM
) ELSE (
    REM Check if the Player can afford this item.
    IF %coins% LSS %silverArmor_p% (
        REM The Player cannot afford this item.
        SET displayMessage=Sorry, you can't afford this.
        GOTO :MM
    ) ELSE (
        REM Take [1] from the Merchant's stock, and add [1] to the Player's inventory, then deduct the price.
        SET /A coins=!coins! -%silverArmor_p%
        SET /A silverArmor_s=!silverArmor_s! -1
        SET /A silverA_q=!silverA_q! +1
        SET displayMessage=Purchased 1 Silver Armor for %silverArmor_p%.
        GOTO :MM
    )
)

REM Buy Gold Armor store logic.
:buy_gold_armor
REM Check if the item is available.
IF %goldArmor_s% EQU 0 (
    REM This item is out of stock.
    SET displayMessage=Afraid I'm out of that item at the moment.
    GOTO :MM
) ELSE (
    REM Check if the Player can afford this item.
    IF %coins% LSS %goldArmor_p% (
        REM The Player cannot afford this item.
        SET displayMessage=Sorry, you can't afford this.
        GOTO :MM
    ) ELSE (
        REM Take [1] from the Merchant's stock, and add [1] to the Player's inventory, then deduct the price.
        SET /A coins=!coins! -%goldArmor_p%
        SET /A goldArmor_s=!goldArmor_s! -1
        SET /A goldA_q=!goldA_q! +1
        SET displayMessage=Purchased 1 Gold Armor for %goldArmor_p%.
        GOTO :MM
    )
)