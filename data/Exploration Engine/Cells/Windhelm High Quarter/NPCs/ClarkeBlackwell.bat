@ECHO OFF
TITLE (Windhelm High Quarter) Clarke Blackwell ^| Name: %player_name% ^| Class: %player_class%
REM Clarke Blackwell Encounter v1 (231209)

REM Requirements for recruiting this NPC:
REM Reputation of 10 or greater.
REM Speech skill of 5 or greater.
REM Did not pick the "X" blessing.
REM THESE REQUIREMENTS ARE NOT ...REQUIRED AT THIS TIME.

REM Debug mode - used for testbed introduction of NPCs and the party system.
:MAIN_DEBUG
CLS
ECHO.
ECHO Clarke Blackwell NPC, Sorceror.
ECHO DEBUG OPTIONS
ECHO DEBUG MESSAGE: %NPCdebug%
ECHO [1 / ADD TO PARTY ] ^| [2 / REMOVE FROM PARTY ] ^| [3 / EXIT ] 
CHOICE /C 12E /N /M ">"
IF ERRORLEVEL 3 GOTO :EOF
IF ERRORLEVEL 2 GOTO :RFP
IF ERRORLEVEL 1 GOTO :ATP

REM Add this NPC to the Player's party and call SLOP to save data.
:ATP
REM Check which Party Slots are open (if any) and attempt to assign this NPC in this order:
REM Slot 1, Slot 2, Slot 3.
REM Since it goes down this list in order, there shouldn't ever be a case in which you can assign the same NPC to two separate party slots... I hope.
IF %PM1name% == VACANT (
    SET PM1name=Clarke Blackwell
    SET NPCdebug=Clarke Blackwell added to Player party in Party Slot 1.
    SET SLOPr=SAVE
    CALL "%cd%\data\functions\SLOP.bat"
    GOTO :MAIN_DEBUG
) ELSE (
    IF %PM2name% == VACANT (
        SET PM2name=Clarke Blackwell
        SET NPCdebug=Clarke Blackwell added to Player party in Party Slot 2.
        SET SLOPr=SAVE
        CALL "%cd%\data\functions\SLOP.bat"
        GOTO :MAIN_DEBUG
    ) ELSE (
        IF %PM3name% == VACANT (
            SET PM3name=Clarke Blackwell
            SET NPCdebug=Clarke Blackwell added to Player party in Party Slot 3.
            SET SLOPr=SAVE
            CALL "%cd%\data\functions\SLOP.bat"
            GOTO :MAIN_DEBUG
        ) ELSE (
            REM Party Slots full, cannot add.
            SET NPCdebug=No empty party slots.
            GOTO :MAIN_DEBUG
        )
    )
)

REM Remove this NPC from the Player's party and call SLOP to save data.
:RFP
REM Well, now we need to find which slot this NPC actually ended up in so...
IF %PM1name% == Clarke Blackwell (
    SET PM1name=VACANT
    SET NPCdebug=Removed Clarke Blackwell from Party Slot 1.
    SET SLOPr=SAVE
    CALL "%cd%\data\functions\SLOP.bat"
    GOTO :MAIN_DEBUG
) ELSE (
    IF %PM2name% == Clarke Blackwell (
        SET PM2name=VACANT
        SET NPCdebug=Removed Clarke Blackwell from Party Slot 2.
        SET SLOPr=SAVE
        CALL "%cd%\data\functions\SLOP.bat"
        GOTO :MAIN_DEBUG
    ) ELSE (
        IF %PM3name% == Clarke Blackwell (
            SET PM3name=VACANT
            SET NPCdebug=Removed Clarke Blackwell from Party Slot 3.
            SET SLOPr=SAVE
        CALL "%cd%\data\functions\SLOP.bat"
        GOTO :MAIN_DEBUG
        )
    )
)

REM Main screen.
:MAIN
CLS
SET CBL=MAIN
ECHO.
ECHO