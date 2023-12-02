@ECHO OFF
TITLE (Windhelm Plaza - Lorekeeper, Al-Gryf Samis) ^| Name: %player_name% ^| Class: %player_class% 
REM Plaza v2 231127 - For Build 2 "Bottle o' Features"

REM Used to "remember" which screen the Player was last on.
SET CS=dash

REM DASHBOARD
:dash
CLS
ECHO.
ECHO                                      LOREKEEPER AL-GRYF SAMIS
ECHO                                       ...Can you even read?
ECHO.
ECHO COINS: %COINS% ^| AFFINITY: %player_affinity_lorekeeper%
ECHO %displayMessage%
ECHO ========================================================================================================================
ECHO [1 / BOOKS] ^| [2 / SCROLLS] ^| [T / TALK] ^| [E / GO BACK]
CHOICE /C 12TE /N /M ">"
IF ERRORLEVEL 4 GOTO :EOF
IF ERRORLEVEL 3 GOTO :TALK
IF ERRORLEVEL 2 GOTO :SCROLLS
IF ERRORLEVEL 1 GOTO :BOOKS

REM View available books.
:BOOKS
SET CS=BOOKS
CLS
ECHO.
ECHO                                           LOREKEEPER GRYF
ECHO                                 Hm, what books interest you, Shard?
ECHO.
ECHO COINS: %COINS% ^| AFFINITY: %player_affinity_lorekeeper%
ECHO %displayMessage%
ECHO ========================================================================================================================
ECHO [1 /  Traveler's Journal] ^| [2 / Merchants Guide] ^| [E / GO BACK]
ECHO [50 / COINS]              ^| [200 / COINS]
CHOICE /C 12E /N /M ">"
IF ERRORLEVEL 3 GOTO :dash
IF ERRORLEVEL 2 GOTO :buy_merchants_guide
IF ERRORLEVEL 1 GOTO :buy_travelers_journal

REM Logic for purchasing the "Traveler's Guide" book.
:buy_travelers_journal
IF %travelers_journalL_q% EQU 0 (
    GOTO :OOS
) ELSE (
    IF %player_affinity_lorekeeper% GTR 400 (
        IF %COINS% LSS 25 (
            GOTO :CAI
        ) ELSE (
            SET /A COINS=!COINS! -25
            SET /A travelers_journal_q=!travelers_journal_q! +1
            SET displayMessage=Purchased 1 Traveler's Journal for 25 coins! [AFFINITY]
            GOTO :BOOKS
        )
    ) ELSE (
        IF %COINS% LSS 50 (
            GOTO :CAI
        ) ELSE (
            SET /A COINS=!COINS! -50
            SET /A travelers_journal_q=!travelers_journal_q! +1
            SET displayMessage=Purchased 1 Traveler's Journal for 50 coins!
            GOTO :BOOKS
        )
    )
)

REM Logic for purchasing the "Merchant's Guide" book.
:buy_merchants_guide
IF %merchants_guideL_q% EQU 0 (
    GOTO :OOS
) ELSE (
    IF %player_affinity_lorekeeper% GTR 400 (
        IF %COINS% LSS 100 (
            GOTO :CAI
        ) ELSE (
            SET /A COINS=!COINS! -100
            SET /A merchants_guide_q=!merchants_guide_q! +1
            SET displayMessage=Purchased 1 Merchant's Guide for 100 coins! [AFFINITY]
            GOTO :BOOKS
        )
    ) ELSE (
        IF %COINS% LSS 50 (
            GOTO :CAI
        ) ELSE (
            SET /A COINS=!COINS! -200
            SET /A merchants_guide_q=!merchants_guide_q! +1
            SET displayMessage=Purchased 1 Traveler's Journal for 200 coins!
            GOTO :BOOKS
        )
    )
)

REM View available scrolls.
:SCROLLS
SET CS=SCROLLS
CLS
ECHO.
ECHO                                           LOREKEEPER GRYF
ECHO                                 Hm, what books interest you, Shard?
ECHO.
ECHO COINS: %COINS% ^| AFFINITY: %player_affinity_lorekeeper%
ECHO %displayMessage%
ECHO ========================================================================================================================
ECHO [1 / Guide to Blades] ^| [E / GO BACK]
ECHO [500 / COINS]
CHOICE /C 1E /N /M ">"
IF ERRORLEVEL 2 GOTO :dash
IF ERRORLEVEL 1 GOTO :buy_guide_to_blades

:buy_guide_to_blades
IF %guide_to_bladesL_q% EQU 0 (
    GOTO :OOS
) ELSE (
    IF %player_affinity_lorekeeper% GTR 400 (
        IF %COINS% LSS 250 (
            GOTO :CAI
        ) ELSE (
            SET /A COINS=!COINS! -250
            SET /A guide_to_blades_q=!guide_to_blades_q! +1
            SET displayMessage=Purchased 1 Guide to Blades for 250 coins! [AFFINITY]
            GOTO :BOOKS
        )
    ) ELSE (
        IF %COINS% LSS 500 (
            GOTO :CAI
        ) ELSE (
            SET /A COINS=!COINS! -500
            SET /A guide_to_blades_q=!guide_to_blades_q! +1
            SET displayMessage=Purchased 1 Guide to Blades for 500 coins!
            GOTO :BOOKS
        )
    )
)

REM Out of Stock.
:OOS
SET displayMessage=This item is out of stock.
GOTO :%CS%

:REM Cannot afford item
:CAI
SET displayMessage=You cannot afford this item.
GOTO :%CS%

REM Dialogue screen.
:TALK