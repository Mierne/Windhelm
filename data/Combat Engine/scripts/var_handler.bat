@ECHO OFF
TITLE EVIE v1.0.1
REM Enemy Variable Intializer Enhanced (EVIE) - Version 1.0.1 (231111) for Windhelm v1.2b "Koritsu"
REM --

REM Tells the inventory script where to send the player when leaving.
SET invCaller=CombatEngine

REM Create enemy variables :3
:CEV
REM Below is a list of Variables, each list pertains to a specific enemy.
REM Global Variables
SET armorCalculated=0
SET plrStun=False
SET enLooted=0

REM BANDIT VARIABLES
SET iBanditHP=80
SET iBanditAT_b=14
SET iBanditAT=14
SET iBanditWK=False

REM JESTER VARIABLES
SET iJesterHP=125
SET iJesterAT_b=22
SET iJesterAT=22
SET iJesterWK=False

REM GNOME VARIABLES
SET iGnomeHP=75
SET iGnomeAT_b=28
SET iGnomeAT=28
SET iGnomeWK=True

REM JESTER COOLDOWNS
REM Jester "Joke" attack, dealing multiplied damage.
SET iJesterJK=6

REM HUNTER VARIABLES
SET iHunterHP=115
SET iHunterAT_b=20
SET iHunterAT=20
SET iHunterWK=False

REM GOBLIN VARIABLES
SET iGoblinHP=50
SET iGoblinAT_b=16
SET iGoblinAT=16
SET iGoblinWK=False

REM GNOME COOLDOWNS
REM Gnome "Poke" Attack, dealing multiplied damage.
SET iGnomePA=4
CALL "%cd%\data\functions\Combat Engine\Combat Engine.bat"
GOTO :EOF