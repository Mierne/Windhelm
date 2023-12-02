@ECHO OFF
TITLE WINDHELM PLAZA - THE ARMORER
REM Armorer v1.1 231028 - Windhelm v1.1b "Autumn Awakening"

REM MERCHANT DASHBOARD / MAIN MENU
:dash
CLS
ECHO.
TYPE "%cd%\data\ascii\npcs\armorer.txt"
ECHO.
ECHO                                           ARMORER
ECHO                                 Hail, Shard. What can I do for you?
ECHO.
ECHO COINS: %coins% ^| AFFINITY: %player_affinity_armorer%
ECHO %displayMessage%
ECHO ========================================================================================================================
ECHO [1] BUY ^| [T] TALK ^| [S] SELL ^| [E] LEAVE
CHOICE /C 1TSE /N /M ">"
IF ERRORLEVEL 4 GOTO :EOF
IF ERRORLEVEL 3 GOTO :sell_armor
IF ERRORLEVEL 2 GOTO :armorer_dialogue
IF ERRORLEVEL 1 GOTO :buy_armor

REM BUY ARMOR
:buy_armor
TITLE WP ARMOR - BUY ARMOR
CLS
ECHO.
TYPE "%cd%\data\ascii\npcs\armorer.txt"
ECHO.
ECHO                                           ARMORER
ECHO                                  I suppose I can spare some coin.
ECHO.
ECHO COINS: %coins%
ECHO %displayMessage%
ECHO ========================================================================================================================
ECHO [1] CACTUS ARMOR ^| [2] STONE ARMOR ^| [3] STEEL ARMOR ^| [4] SCALED ARMOR ^| [E] BACK
ECHO     50 COINS     ^|     100 COINS   ^|     570 COINS   ^|     900 COINS    ^|
CHOICE /C 1234E /N /M ">"
IF ERRORLEVEL 5 GOTO :dash
IF ERRORLEVEL 4 GOTO :buy_scaled_armor
IF ERRORLEVEl 3 GOTO :buy_steel_armor
IF ERRORLEVEL 2 GOTO :buy_stone_armor
IF ERRORLEVEL 1 GOTO :buy_cactus_armor

:buy_cactus_armor
IF %player_affinity_armorer% GEQ 400 (
    IF %coins% LSS %cactusAA1_price% (
        GOTO :cannotAfford
    ) ELSE (
        SET /A coins=!coins! -%cactusAA1_price%
        SET /A cactusA_q=!cactusA_q! +1
        SET displayMessage=Purchased Cactus Armor for %cactusAA1_price%!
        GOTO :dash
    )
) ELSE (
    IF %coins% LSS %cactusA_price% (
        GOTO :cannotAfford
    ) ELSE (
        SET /A coins=!coins! -%cactusA_price%
        SET /A cactusA_q=!cactusA_q! +1
        SET displayMessage=Purchased Cactus Armor for %cactusA_price%!
        GOTO :dash
    )
)

:buy_stone_armor
IF %player_affinity_armorer% GEQ 400 (
    IF %coins% LSS %stoneAA1_price% (
        GOTO :cannotAfford
    ) ELSE (
        SET /A coins=!coins! -%stoneAA1_price%
        SET /A stoneA_q=!stoneA_q! +1
        SET displayMessage=Purchased Stone Armor for %stoneAA1_price%!
        GOTO :dash
    )
) ELSE (
    IF %coins% LSS %stoneA_price% (
        GOTO :cannotAfford
    ) ELSE (
        SET /A coins=!coins! -%stoneA_price%
        SET /A stoneA_q=!stoneA_q! +1
        SET displayMessage=Purchased Stone Armor for %stoneA_price%!
        GOTO :dash
    )
)

:buy_steel_armor
IF %player_affinity_armorer% GEQ 400 (
    IF %coins% LSS %steelAA1_price% (
        GOTO :cannotAfford
    ) ELSE (
        SET /A coins=!coins! -%steelAA1_price%
        SET /A steelA_q=!steelA_q! +1
        SET displayMessage=Purchased Steel Armor for %steelAA1_price%!
        GOTO :dash
    )
) ELSE (
    IF %coins% LSS %steelA_price% (
        GOTO :cannotAfford
    ) ELSE (
        SET /A coins=!coins! -%steelA_price%
        SET /A steelA_q=!steelA_q! +1
        SET displayMessage=Purchased Steel Armor for %steelA_price%!
        GOTO :dash
    )
)

:buy_scaled_armor
IF %player_affinity_armorer% GEQ 400 (
    IF %coins% LSS %scaledAA1_price% (
        GOTO :cannotAfford
    ) ELSE (
        SET /A coins=!coins! -%scaledAA1_price%
        SET /A scaledA_q=!scaledA_q! +1
        SET displayMessage=Purchased Scaled Armor for %scaledAA1_price%!
        GOTO :dash
    )
) ELSE (
    IF %coins% LSS %cactusA_price% (
        GOTO :cannotAfford
    ) ELSE (
        SET /A coins=!coins! -%cactusA_price%
        SET /A cactusA_q=!cactusA_q! +1
        SET displayMessage=Purchased Cactus Armor for %cactusA_price%!
        GOTO :dash
    )
)


REM SELL ARMOR
:sell_armor
TITLE WP ARMORER - SELL ARMOR
CLS
ECHO.
TYPE "%cd%\data\ascii\npcs\armorer.txt"
ECHO.
ECHO                                           ARMORER
ECHO                                  I suppose I can spare some coin.
ECHO.
ECHO COINS: %coins%
ECHO %displayMessage%
ECHO ========================================================================================================================
ECHO [1] CACTUS ARMOR ^| [2] STONE ARMOR ^| [3] STEEL ARMOR ^| [4] SCALED ARMOR ^| [5] GUARD ARMOR ^| [E] BACK
ECHO     45 COINS     ^|     90 COINS    ^|     400 COINS   ^|     700 COINS    ^|     1200 COINS  ^|
ECHO                        [E] EXIT
CHOICE /C 12345E /N /M ">"
IF ERRORLEVEL 6 GOTO :dash
IF ERRORLEVEL 5 GOTO :sell_guard_armor
IF ERRORLEVEL 4 GOTO :sell_scaled_armor
IF ERRORLEVEL 3 GOTO :sell_steel_armor
IF ERRORLEVEL 2 GOTO :sell_stone_armor
IF ERRORLEVEL 1 GOTO :sell_cactus_armor

REM Sell Armor functions.
:sell_cactus_armor
IF %cactusA_q% EQU 0 (
    GOTO :no_item
) ELSE (
    ECHO SOLD CACTUS >> output.log
    SET /A cactusA_q=!cactusA_q! -1
    SET /A coins=!coins! +45
    SET displayMessage=Sold Cactus armor for 45 coins!
    GOTO :sell_armor
)

:sell_stone_armor
IF %stoneA_q% EQU 0 (
    GOTO :no_item
) ELSE (
    SET /A stoneA_q=!stoneA_q! -1
    SET /A coins=!coins! +90
    SET displayMessage=Sold Stone armor for 90 coins!
    GOTO :sell_armor
)

:sell_steel_armor
IF %steelA_q% EQU 0 (
    GOTO :no_item
) ELSE (
    SET /A steelA_q=!steelA_q! -1
    SET /A coins=!coins! +400
    SET displayMessage=Sold Steel armor for 400 coins!
    GOTO :sell_armor
)

:sell_scaled_armor
IF %scaledA_q% EQU 0 (
    GOTO :no_item
) ELSE (
    SET /A scaledA_q=!scaledA_q! -1
    SET /A coins=!coins! +700
    SET displayMessage=Sold Scaled armor for 700 coins!
    GOTO :sell_armor
)

:sell_guard_armor
IF %guardA_q% EQU 0 (
    GOTO :no_item
) ELSE (
    SET /A guardA_q=!cactusA_q! -1
    SET /A coins=!coins! +1200
    SET displayMessage=Sold Guard armor for 1200 coins!
    GOTO :sell_armor
)

REM "No Item" error message.
:no_item
SET displayMessage=You can't sell something you don't have!
GOTO :sell_armor

:cannotAfford
SET displayMessage=You cannot afford this item.
GOTO :buy_armor

REM Not implemented.
:armorer_dialogue
GOTO :dash