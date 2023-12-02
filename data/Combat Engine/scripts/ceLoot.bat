@ECHO OFF
REM Combat Engine v6 Looting Script.
REM v1.0 (231112)

REM Check if this enemy has already been looted.
IF %enLooted% EQU 1 (
    SET plrMessage=[EMPTY] enemy already looted!
    GOTO :EOF
) ELSE (
    REM Set the "Enemy Looted" variable to 1 to prevent spamming for infinite rewards.
    SET enLooted=1
    GOTO :GENERIC_CHANCE
)

REM Generate a random number between 1-10. The higher the number, the higher the chance for enemy-specific loot.
:GENERIC_CHANCE
SET /A GC=%RANDOM% %%10
REM Now check which enemy was fought.
IF %currentEnemy% EQU iBandit (
    IF %GC% EQU 10 (
        GOTO :iBanditLoot
    ) ELSE IF %GC% EQU 9 (
        GOTO :iBanditLoot
    ) ELSE IF %GC% EQU 8 (
        GOTO :iBanditLoot
    ) ELSE (
        GOTO :GENERIC
    )
) ELSE IF %currentEnemy% EQU iJester (
    IF %GC% EQU 10 (
        GOTO :iJesterLoot
    ) ELSE IF %GC% EQU 9 (
        GOTO :iJesterLoot
    ) ELSE IF %GC% EQU 8 (
        GOTO :iJesterLoot
    ) ELSE (
        GOTO :GENERIC
    )
) ELSE IF %currentEnemy% EQU iGnome (
    IF %GC% EQU 10 (
        GOTO :iGnomeLoot
    ) ELSE IF %GC% EQU 9 (
        GOTO :iGnomeLoot
    ) ELSE IF %GC% EQU 8 (
        GOTO :iGnomeLoot
    ) ELSE (
        GOTO :GENERIC
    )
) ELSE IF %currentEnemy% EQU iHunter (
    IF %GC% EQU 10 (
        GOTO :iHunterLoot
    ) ELSE IF %GC% EQU 9 (
        GOTO :iHunterLoot
    ) ELSE IF %GC% EQU 8 (
        GOTO :iHunterLoot
    ) ELSE (
        GOTO :GENERIC
    )
) ELSE IF %currentEnemy% EQU iGoblin (
    IF %GC% EQU 10 (
        GOTO :iGoblinLoot
    ) ELSE IF %GC% EQU 9 (
        GOTO :iGoblinLoot
    ) ELSE IF %GC% EQU 8 (
        GOTO :iGoblinLoot
    ) ELSE (
        GOTO :GENERIC
    )
) ELSE (
    REM Error handling.
    ECHO Enemy type unavailable. >> ERROR.log
    SET errorType=EnemyType
    CALL "%cd%\data\functions\errorhandling.bat"
    EXIT /B
)

REM Generic loot that can be found when looting any enemy.
:GENERIC
REM Generate a random number between 1-10. Higher numbers are rarer items.
SET /A GLOOT=%RANDOM% %%10
IF %GLOOT% EQU 10 (
    SET /A COINS=!COINS! +1000
    SET plrMessage=[RARE] found 100 gold!
    GOTO :EOF
) ELSE IF %GLOOT% EQU 9 (
    SET /A stoneA_q=!stoneA_q! +1
    SET plrMessage=[RARE] found 1 Stone Armor!
    GOTO :EOF
) ELSE IF %GLOOT% EQU 8 (
    SET /A shortsword_q=!shortsword_q! +1
    SET plrMessage=[UNCOMMON] found 1 shortsword!
    GOTO :EOF
) ELSE IF %GLOOT% EQU 7 (
    SET /A longsword_q=!longsword_q! +1
    SET plrMessage=[UNCOMMON] found 1 longsword!
    GOTO :EOF
) ELSE IF %GLOOT% EQU 6 (
    SET /A COINS=!COINS! +500
    SET plrMessage=[UNCOMMON] found 500 gold!
    GOTO :EOF
) ELSE IF %GLOOT% EQU 5 (
    SET /A COINS=!COINS! +250
    SET plrMessage=[COMMON] found 250 gold!
    GOTO :EOF
) ELSE IF %GLOOT% EQU 4 (
    SET /A COINS=!COINS! +150
    SET plrMessage=[COMMON] found 150 gold!
    GOTO :EOF
) ELSE IF %GLOOT% EQU 3 (
    SET /A COINS=!COINS! + 100
    SET plrMessage=[COMMON] found 100 coins!
    GOTO :EOF
) ELSE (
    SET plrMessage=[EMPTY] you didn't find anything!
    GOTO :EOF
)

REM Bandit specific loot.
:iBanditLoot
REM Generate a number between 1-5, the higher the number the rarer the loot.
SET /A BLOOT=%RANDOM% %%5
IF %BLOOT% EQU 5 (
    SET /A healingT_q=!healingT_q! +1
    SET plrMessage=[RARE] found 1 healing tonic!
    GOTO :EOF
) ELSE IF %BLOOT% EQU 4 (
    SET /A staminaT_q=!staminaT_q! +1
    SET plrMessage=[RARE] found 1 stamina tonic!
    GOTO :EOF
) ELSE IF %BLOOT% EQU 3 (
    SET /A guide_to_blades_q=!guide_to_blades_q! +1
    SET plrMessage=[UNCOMMON] found 1 Guide to Blade book!
    GOTO :EOF
) ELSE IF %BLOOT% EQU 2 (
    SET /A COINS=!COINS! +90
    SET plrMessage=[COMMOM] found 90 gold!
    GOTO :EOF
) ELSE (
    SET plrMessage=[EMPTY] you didn't find anything!
    GOTO :EOF
)

REM Jester specific loot.
:iJesterLoot
REM Generate a number between 1-5, the higher the number the rarer the loot.
SET /A JLOOT=%RANDOM% %%5
IF %JLOOT% EQU 5 (
    SET /A magickaT_q=!magickaT_q! +1
    SET plrMessage=[RARE] found 1 magicka tonic!
    GOTO :EOF
) ELSE IF %JLOOT% EQU 4 (
    SET /A COINS=!COINS! +2000
    SET plrMessage=[RARE] found 2000 gold!
    GOTO :EOF
) ELSE IF %JLOOT% EQU 3 (
    SET /A merchants_guide_q=!merchants_guide_q! +1
    SET plrMessage=[UNCOMMON] found 1 Merchant's Guide book!
    GOTO :EOF
) ELSE IF %JLOOT% EQU 2 (
    SET /A COINS=!COINS! +200
    SET plrMessage=[COMMOM] found 200 gold!
    GOTO :EOF
) ELSE (
    SET plrMessage=[EMPTY] you didn't find anything!
    GOTO :EOF
)

REM Gnome specific loot.
:iGnomeLoot
REM Generate a number between 1-5, the higher the number the rarer the loot.
SET /A GLOOT=%RANDOM% %%5
IF %GLOOT% EQU 5 (
    SET /A healingT_q=!healingT_q! +1
    SET plrMessage=[RARE] found 1 healing tonic!
    GOTO :EOF
) ELSE IF %GLOOT% EQU 4 (
    SET /A staminaT_q=!staminaT_q! +1
    SET plrMessage[RARE] found 1 stamina tonic!
    GOTO :EOF
) ELSE IF %GLOOT% EQU 3 (
    SET /A guide_to_blades_q=!guide_to_blades_q! +1
    SET plrMessage=[UNCOMMON] found 1 Guide to Blade book!
    GOTO :EOF
) ELSE IF %GLOOT% EQU 2 (
    SET /A COINS=!COINS! +90
    SET plrMessage[COMMOM] found 90 gold!
    GOTO :EOF
) ELSE (
    SET plrMessage[EMPTY] you didn't find anything!
    GOTO :EOF
)

REM Hunter specific loot.
:iHunterLoot
REM Generate a number between 1-5, the higher the number the rarer the loot.
SET /A HLOOT=%RANDOM% %%5
IF %HLOOT% EQU 5 (
    SET /A healingT_q=!healingT_q! +1
    SET plrMessage=[RARE] found 1 healing tonic!
    GOTO :EOF
) ELSE IF %HLOOT% EQU 4 (
    SET /A staminaT_q=!staminaT_q! +1
    SET plrMessage[RARE] found 1 stamina tonic!
    GOTO :EOF
) ELSE IF %HLOOT% EQU 3 (
    SET /A guide_to_blades_q=!guide_to_blades_q! +1
    SET plrMessage=[UNCOMMON] found 1 Guide to Blade book!
    GOTO :EOF
) ELSE IF %HLOOT% EQU 2 (
    SET /A COINS=!COINS! +90
    SET plrMessage[COMMOM] found 90 gold!
    GOTO :EOF
) ELSE (
    SET plrMessage[EMPTY] you didn't find anything!
    GOTO :EOF
)

REM Goblin specific loot.
:iGoblinLoot
REM Generate a number between 1-5, the higher the number the rarer the loot.
SET /A GOLOOT=%RANDOM% %%5
IF %GOLOOT% EQU 5 (
    SET /A healingT_q=!healingT_q! +1
    SET plrMessage=[RARE] found 1 healing tonic!
    GOTO :EOF
) ELSE IF %GOLOOT% EQU 4 (
    SET /A staminaT_q=!staminaT_q! +1
    SET plrMessage[RARE] found 1 stamina tonic!
    GOTO :EOF
) ELSE IF %GOLOOT% EQU 3 (
    SET /A guide_to_blades_q=!guide_to_blades_q! +1
    SET plrMessage=[UNCOMMON] found 1 Guide to Blade book!
    GOTO :EOF
) ELSE IF %GOLOOT% EQU 2 (
    SET /A COINS=!COINS! +90
    SET plrMessage[COMMOM] found 90 gold!
    GOTO :EOF
) ELSE (
    SET plrMessage[EMPTY] you didn't find anything!
    GOTO :EOF
)