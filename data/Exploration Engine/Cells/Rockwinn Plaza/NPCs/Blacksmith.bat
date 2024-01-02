@ECHO OFF
TITLE (Rockwinn Plaza) - Blacksmith ^| Name: %player_name% the %player_class%
REM BLACKSMITH v3.0 (240102) - For Bottle o' Features.

REM Main Menu, used to access submenus.
:MM
CLS
ECHO +--------------------------------------------------------------------------------------------------+
ECHO ^|                                     What can be done for you, Shard?                                         +
ECHO ^| %displayMessage%
ECHO +--------------------------------------------------------------------------------------------------+
ECHO ^|                                                                                                  ^|
ECHO +--------------------------------------------------------------------------------------------------+
ECHO ^| COINS: %coins% ^| AFFINITY: %player_affinity_blacksmith%
ECHO +--------------------------------------------------------------------------------------------------+
ECHO +                                          ITEM STOCK                                                +
ECHO +--------------------------------------------------------------------------------------------------+
ECHO ^| LONG SWORD: %lSword_s% ^| SHORT SWORD: %sSword_s%
ECHO ^|
ECHO ^|
ECHO +--------------------------------------------------------------------------------------------------+
ECHO + [1 / LONG SWORD ] ^| [2 / SHORT SWORD ]
ECHO +
ECHO +--------------------------------------------------------------------------------------------------+
CHOICE /C 12TE /N /M ">"
IF ERRORLEVEL 4 GOTO :EOF
IF ERRORLEVEL 3 GOTO :blacksmith_dialogue
IF ERRORLEVEL 2 GOTO :buy_short_sword
IF ERRORLEVEL 1 GOTO :buy_long_sword

REM Conformation menu displaying art and price.
:buy_long_sword
CLS
ECHO.
TYPE "%cd%\data\ascii\menus\purchase.txt"
ECHO.
ECHO                                          Purchase this Weapon?
ECHO +----------------------------------------------------------------------------------------------------------------------+
ECHO + COST: %lSword_p%
ECHO + The Long Sword, a favorite amongst paladins and knights alike for it's large range and blade.
ECHO + This weapon deals X damage, consumes X stamina and X AP. The damage type is PHYS.
ECHO +----------------------------------------------------------------------------------------------------------------------+
ECHO [1 / PURCHASE ] ^| [E / BACK]
CHOICE /C 1E /N /M ">"
IF ERRORLEVEL 2 GOTO :MM
IF ERRORLEVEL 1 GOTO :buy_long_sword_logic

REM Purchase Long Sword logic.
:buy_long_sword_logic
REM Check if the item is available.
IF %lSword_s% EQU 0 (
    REM This item is out of stock.
    SET displayMessage=Afraid I'm out of that item at the moment.
    GOTO :MM
) ELSE (
    REM Check if the Player can afford this item.
    IF %coins% LSS %lSword_p% (
        REM The Player cannot afford this item.
        SET displayMessage=Sorry, you can't afford this.
        GOTO :MM
    ) ELSE (
        REM Take [1] from the Merchant's stock, and add [1] to the Player's inventory, then deduct the price.
        SET /A coins=!coins! -%lSword_p%
        SET /A lSword_s=!lSword_s! -1
        SET /A longsword_q=!longsword_q! +1
        SET displayMessage=Purchased 1 Long Sword for %lSword_p%.
        GOTO :MM
    )
)

REM Comformation menu displaying art and price.
:buy_short_sword
CLS
ECHO.
TYPE "%cd%\data\ascii\menus\purchase.txt"
ECHO.
ECHO                                          Purchase this Weapon?
ECHO +----------------------------------------------------------------------------------------------------------------------+
ECHO + COST: %sSword_p%
ECHO + The Short Sword, a favorite among gurads and civilians for it's light weight and ease of use.
ECHO + This weapon deals X damage, consumes X stamina and X AP. The damage type is PHYS.
ECHO +----------------------------------------------------------------------------------------------------------------------+
ECHO [1 / PURCHASE ] ^| [E / BACK]
CHOICE /C 1E /N /M ">"
IF ERRORLEVEL 2 GOTO :MM
IF ERRORLEVEL 1 GOTO :buy_short_sword_logic

REM Purchase Short Sword logic.
:buy_short_sword_logic
IF %sSword_s% EQU 0 (
    REM This item is out of stock.
    SET displayMessage=Afraid I'm out of that item at the moment.
    GOTO :MM
) ELSE (
    REM Check if the Player can afford this item.
    IF %coins% LSS %sSword_p% (
        REM The Player cannot afford this item.
        SET displayMessage=Sorry, you can't afford this.
        GOTO :MM
    ) ELSE (
        REM Take [1] from the Merchant's stock, and add [1] to the Player's inventory, then deduct the price.
        SET /A coins=!coins! -%sSword_p%
        SET /A sSword_s=!sSword_s! -1
        SET /A shortsword_q=!shortsword_q! +1
        SET displayMessage=Purchased 1 Long Sword for %sSword_p%.
        GOTO :MM
    )
)

REM Blank, for now.
:blacksmith_dialogue
GOTO :MM