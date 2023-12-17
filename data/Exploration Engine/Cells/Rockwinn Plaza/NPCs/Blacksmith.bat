@ECHO OFF
TITLE (Rockwinn Plaza) - Blacksmith ^| Name: %player_name% ^| Class: %player_class%
REM BLACKSMITH v3.0 (231217) - For Bottle o' Features.

REM Variables
SET weaponMenu=buySwords
SET sellType=sellArmor

REM Affinity Checks to prevent spam.
:AFFC
(
SET /P AFFC1_B=
)<"%cd%\data\player\Player Stats.txt"
GOTO :dash

REM DASHBOARD / MAIN MENU
:dash
CLS
ECHO.
ECHO                                           IRON-FIST ABE
ECHO                                 Hail, Shard. What can I do for you?
ECHO.
ECHO COINS: %coins% ^| AFFINITY: %player_affinity_blacksmith%
ECHO %displayMessage%
ECHO ========================================================================================================================
ECHO [1] SWORDS ^| [2] AXES ^| [3] MACES ^| [4] RANGED |^ [T] TALK ^| [E] LEAVE
CHOICE /C 1234TE /N /M ">"
IF ERRORLEVEL 6 GOTO :EOF
IF ERRORLEVEL 5 GOTO :blacksmith_dialogue
IF ERRORLEVEL 4 GOTO :buyRanged
IF ERRORLEVEL 3 GOTO :buyMaces
IF ERRORLEVEL 2 GOTO :buyAxes
IF ERRORLEVEL 1 GOTO :buySwords

REM BUY SWORDS
:buySwords
SET weaponMenu=buySwords
CLS
ECHO.
ECHO                                           IRON-FIST ABE
ECHO                                 Hail, Shard. What can I do for you?
ECHO.
ECHO COINS: %coins%
ECHO %displayMessage% (DEBUG)
ECHO %longswordA1_price% (DEBUG)
ECHO %longsword_price% (DEBUG)
ECHO LONGSWORD %longsword_q% (DEBUG)
ECHO SHORTSWORD %shortsword_q% (DEBUG)
ECHO ========================================================================================================================
ECHO [1] Longsword ^| [2] Shortsword ^| [E] BACK
ECHO     [%longsword_price%]     ^|     [%shortsword_price%]
CHOICE /C 12E /N /M ">"
IF ERRORLEVEL 3 GOTO :dash
IF ERRORLEVEL 2 GOTO :buyShortSword
IF ERRORLEVEL 1 GOTO :buyLongSword

:buyLongSword
IF %player_affinity_blacksmith% GEQ 400 (
    IF %coins% LSS %longswordA1_price% (
        GOTO :cannotAfford
    ) ELSE (
        SET /A coins=!coins! -%longswordA1_price%
        SET /A longsword_q=!longsword_q! +1
        SET displayMessage=AFF
        GOTO :buySwords
    )
) ELSE (
    IF %coins% LSS %longsword_price% (
        GOTO :cannotAfford
    ) ELSE (
        SET /A coins=!coins! -%longsword_price%
        SET /A longsword_q=!longsword_q! +1
        SET displayMessage=NORM
        GOTO :dash
    )
)

:buyShortSword
IF %player_affinity_blacksmith% GEQ 400 (
    IF %coins% LSS %shortswordA1_price% (
        GOTO :cannotAfford
    ) ELSE (
        SET /A coins=!coins! -%shortsword_price%
        SET /A shortsword_q=!shortsword_q! +1
        SET displayMessage=AFF ... short
        GOTO :buySwords
    )
) ELSE (
    IF %coins% LSS %shortsword_price% (
        GOTO :cannotAfford
    ) ELSE (
        SET /A coins=!coins! -%shortsword_price%
        SET /A shortsword_q=!shortsword_q! +1
        SET displayMessage=NORM ... short
        GOTO :dash
    )
)

REM BUY AXES
:buyAxes
set weaponMenu=buyAxes
CLS
echo.
echo                                           IRON-FIST ABE
echo                                 Hail, Shard. What can I do for you?
echo.
echo LEVELS: %LEVELS% ^| COINS: %COINS%
echo %displayMessage%
echo ========================================================================================================================
echo [1] Great Axe  ^| [E] EXIT
CHOICE /C 1E /N /M ">"
IF ERRORLEVEL 2 GOTO :dash
IF ERRORLEVEL 1 GOTO :buyGreatAxe

:buyGreatAxe
IF %player_affinity_blacksmith% GEQ 400 (
    IF %coins% LSS %greataxeA1_price% (
        GOTO :cannotAfford
    ) ELSE (
        SET /A coins=!coins! -%greataxeA1_price%
        SET /A greataxe_q=!greataxe_q! +1
        SET displayMessage=Purchased Great Axe for %greataxeA1_price%!
        GOTO :dash
    )
) ELSE (
    IF %coins% LSS %greataxe_price% (
        GOTO :cannotAfford
    ) ELSE (
        SET /A coins=!coins! -%greataxe_price%
        SET /A greataxe_q=!greataxe_q! +1
        SET displayMessage=Purchased Great Axe for %greataxe_price%!
        GOTO :dash
    )
)

REM BUY MACES
:buyMaces
SET weaponMenu=buyMaces
CLS
echo.
echo                                           IRON-FIST ABE
echo                                 Hail, Shard. What can I do for you?
echo.
echo LEVELS: %levels% ^| COINS: %coins%
echo %displayMessage%
echo ========================================================================================================================
echo [1] Mace      ^| [E] EXIT
CHOICE /C 1E /N /M ">"
IF ERRORLEVEL 2 GOTO :dash
IF ERRORLEVEL 1 GOTO :buyMace

:buyMace
IF %player_affinity_blacksmith% GEQ 400 (
    IF %coins% LSS %maceA1_price% (
        GOTO :cannotAfford
    ) ELSE (
        SET /A coins=!coins! -%maceA1_price%
        SET /A mace_q=!mace_q! +1
        SET displayMessage=Purchased Mace for %maceA1_price%!
        GOTO :dash
    )
) ELSE (
    IF %coins% LSS %mace_price% (
        GOTO :cannotAfford
    ) ELSE (
        SET /A coins=!coins! -%mace_price%
        SET /A mace_q=!mace_q! +1
        SET displayMessage=Purchased Mace for %mace_price%!
        GOTO :dash
    )
)

REM Buy Ranged weapons/items.
:buyRanged
set weaponMenu=buyRanged
CLS
echo.
echo                                           IRON-FIST ABE
echo                              Lookin' for a ranged type, eh? Let's see here...
echo.
echo LEVELS: %LEVELS% ^| COINS: %COINS%
echo %displayMessage%
echo ========================================================================================================================
echo [1] WOODEN BOW ^| [E] BACK
CHOICE /C 1E /N /M ">"
IF ERRORLEVEL 2 GOTO :dash
IF ERRORLEVEL 1 GOTO :buyWoodenBow

:buyWoodenBow
IF %player_affinity_blacksmith% GEQ 400 (
    IF %coins% LSS %woodenbA1_price% (
        GOTO :cannotAfford
    ) ELSE (
        SET /A coins=!coins! -%woodenbA1_price%
        SET /A woodenb_q=!woodenb_q! +1
        SET displayMessage=Purchased a Wooden Bow for %woodenbA1_price%!
        GOTO :dash
    )
) ELSE (
    IF %coins% LSS %woodenb_price% (
        GOTO :cannotAfford
    ) ELSE (
        SET /A coins=!coins! -%woodenb_price%
        SET /A woodenb_q=!woodenb_q! +1
        SET displayMessage=Purchased a Wooden Bow for %woodenb_price%!
        GOTO :dash
    )
)

REM SELL ITEMS
:sellItems
CLS
echo.
echo                                           IRON-FIST ABE
echo                                  I suppose I can spare some coin.
echo.
echo COINS: %coins%
echo Not currently accepting these items: Axes, Maces.
echo %displayMessage%
echo ========================================================================================================================
echo [1] SWORDS ^| [2] ARMOR ^| [E] EXIT
set /p A=^>
IF %A% == 1 GOTO :sellSwords
IF %A% == 2 GOTO :sellArmor
IF /I "%A%" == "E" GOTO :dash
ECHO %A% is not a valid option, please try again.
PAUSE
GOTO :sellItems

REM SELL ARMOR
:sellArmor
CLS
SET sellType=sellArmor
echo.
echo                                           IRON-FIST ABE
echo                                  I suppose I can spare some coin.
echo.
echo COINS: %coins%
echo %displayMessage%
echo ========================================================================================================================
echo [1] CACTUS ARMOR ^| [2] STONE ARMOR ^| [3] STEEL ARMOR ^|
ECHO     75 COINS     ^|     120 COINS   ^|     700 COINS   ^|
ECHO                        [E] EXIT
set /p A=^>
IF %A% == 1 GOTO :sellCactusArmor
IF %A% == 2 GOTO :sellStoneArmor
IF %A% == 3 GOTO :sellSteelArmor
IF /I "%A%" == "E" GOTO :sellItems
ECHO %A% is not a valid option, please try again.
PAUSE
GOTO :sellItems

:sellCactusArmor
IF %cactusB_b% EQU 0 (
    GOTO :notAccepting
) ELSE (
    IF %cactusA_q% EQU 0 (
        GOTO :noItem
    ) ELSE (
        SET /A cactusA_q=!cactusA_q! -1
        SET /A cactusB_q=!cactusB_q! +1
        SET /A coins=!coins! +%cactusB_price%
        SET displayMessage=Sold Cactus armor for %cactusB_price% coins.
        GOTO :dash
    )
)

:sellStoneArmor
IF %stoneB_b% EQU 0 (
    GOTO :notAccepting
) ELSE (
    IF %stoneB_q% EQU 0 (
        GOTO :noItem
    ) ELSE (
        SET /A stoneA_q=!stoneA_q! -1
        SET /A stoneB_q=!stoneB_q! +1
        SET /A coins=!coins! +%stoneB_price%
        SET displayMessage=Sold Stone armor for %stoneB_price% coins.
        GOTO :dash
    )
)

:sellSteelArmor
IF %steelB_b% EQU 0 (
    GOTO :notAccepting
) ELSE (
    IF %steelA_q% EQU 0 (
        GOTO :noItem
    ) ELSE (
        SET /A steelA_q=!steelA_q! -1
        SET /A steelB_q=!steelB_q! +1
        SET /A coins=!coins! +%steelB_price%
        SET displayMessage=Sold Steel armor for %steelB_price% coins.
        GOTO :dash
    )
)

REM SELL SWORDS
:sellSwords
CLS
SET sellType=sellSwords
echo.
echo                                           IRON-FIST ABE
echo                                  I suppose I can spare some coin.
echo.
echo LEVELS: %LEVELS% ^| COINS: %COINS%
echo %displayMessage%
echo ========================================================================================================================
echo [1] LONGSWORD ^| [2] SHORTSWORD ^|
ECHO     210 COINS ^|     105 COINS  ^|
ECHO                     [E] EXIT
set /p A=^>
IF %A% == 1 GOTO :sellLongSword
IF %A% == 2 GOTO :sellShortSword
IF /I "%A%" == "E" GOTO :dash
echo %A% is not a valid option, please try again.
PAUSE
GOTO :sellSwords

:sellLongSword
IF %longswordB_b% EQU 0 (
    GOTO :notAccepting
) ELSE (
    IF %longsword_q% EQU 0 (
        GOTO :noItem
    ) ELSE (
        SET /A longsword_q=!longsword_q! -1
        SET /A longswordB_q=!longswordB_q! +1
        SET /A coins=!coins! +%longswordB_price%
        SET displayMessage=Sold Longsword for %longswordB_price% coins.
        GOTO :dash
    )
)

:sellShortSword
IF %shortswordB_b% EQU 0 (
    GOTO :notAccepting
) ELSE (
    IF %shortsword_q% EQU 0 (
        GOTO :noItem
    ) ELSE (
        SET /A shortsword_q=!shortsword_q! -1
        SET /A shortswordB_q=!shortswordB_q! +1
        SET /A coins=!coins! +%shortswordB_price%
        SET displayMessage=Sold Shortsword for %shortswordB_price% coins.
        GOTO :dash
    )
)

REM Error / Warning messages
:cannotAfford
SET displayMessage=You do not have enough coin for this item.
GOTO :%weaponMenu%

:noItem
SET displayMessage=You do not own this item, and cannot sell it.
GOTO :%sellType%

:notAccepting
SET displayMessage=I'm not accepting this item.
GOTO :%sellType%

:blacksmith_dialogue
CLS
ECHO.
ECHO                                           IRON-FIST ABE
ECHO                                Aye, I can spare a moment for chat.
ECHO.
ECHO COINS: %COINS% ^| AFFINITY: %player_affinity_blacksmith%
ECHO %displayMessage%
ECHO ========================================================================================================================
ECHO [1] Heard any rumors lately?
ECHO [2] What do you know about Shards?
ECHO [3] What do you know about Memories?
ECHO [E] Nevermind.
CHOICE /C 123E /N /M ">"
IF ERRORLEVEL 4 GOTO :dash
IF ERRORLEVEL 3 GOTO :knowledge_about_memories
IF ERRORLEVEL 2 GOTO :what_do_you_know_about_shards
IF ERRORLEVEL 1 GOTO :heard_rumors_lately

REM Randomize similar to the way Skyrim handles it, and don't repeat quests. Oh right, need a questing system first.
:heard_rumors_lately
CLS
ECHO.
ECHO                                           IRON-FIST ABE
ECHO.
ECHO.
ECHO COINS: %COINS% ^| AFFINITY: %player_affinity_blacksmith%
ECHO I don't give that information out for free... But right now? I got nothing.
ECHO ========================================================================================================================
ECHO [E] Nevermind.
CHOICE /C E /N /M ">"
IF ERRORLEVEL 1 GOTO :blacksmith_dialogue

:what_do_you_know_about_shards
CLS
ECHO.
ECHO                                           IRON-FIST ABE
ECHO.
ECHO.
ECHO COINS: %COINS% ^| AFFINITY: %player_affinity_blacksmith%
ECHO Nothing, really. Althought I've whispers that they're simply fragments of the soul but, I don't buy that.
ECHO How can the fragment of a soul wield enough magicka to hold a physical form for longer than 10 seconds?
ECHO If they ARE that powerful, we should all be cowering under some tables.
ECHO ========================================================================================================================
ECHO [1] Have you seen any?
ECHO [E] Nevermind.
CHOICE /C 1E /N /M ">"
IF ERRORLEVEL 2 GOTO :blacksmith_dialogue
IF ERRORLEVEL 1 GOTO :have_you_seen_any_shards

:have_you_seen_any_shards
CLS
ECHO.
ECHO                                           IRON-FIST ABE
ECHO.
ECHO.
ECHO COINS: %COINS% ^| AFFINITY: %player_affinity_blacksmith%
ECHO That's a great question. There's not really much of a way to tell, given how they can apparently seamlessly
ECHO blend in - of course, I don't buy it but what do I know? I'm just some hardheaded Blacksmith...
ECHO Uhm, well. I've heard that one way you can discern a Shard from a Mortal is to observe their eyes,
ECHO They have an ironically soulless look to them, and some Shards also have cracks on their physical forms.
ECHO Sorry but that's all I know.
ECHO ========================================================================================================================
ECHO [1] I think I may be a Shard.
ECHO [E] Nevermind.
CHOICE /C 1E /N /M ">"
IF ERRORLEVEL 2 GOTO :blacksmith_dialogue
IF ERRORLEVEL 1 GOTO :I_might_be_a_shard

:I_might_be_a_shard
CLS
ECHO.
ECHO                                           IRON-FIST ABE
ECHO.
ECHO.
ECHO COINS: %COINS% ^| AFFINITY: %player_affinity_blacksmith%
ECHO ...seriously? I mean... What's it like? Do you know who, or what you were before you... died? Are you going to
ECHO suck my soul out for power or something?
ECHO ========================================================================================================================
ECHO [1 // THREATEN] I might, if you don't give me something.
ECHO [2 // AFFINITY] No, I don't think Shards can do that.
ECHO [3] It's hard to explain. Vague, unrealiable memories mostly.
ECHO [E] Nevermind.
CHOICE /C 123E /N /M ">"
IF ERRORLEVEL 4 GOTO :blacksmith_dialogue
IF ERRORLEVEL 3 GOTO :hard_to_explain
IF ERRORLEVEL 2 GOTO :no_I_cant
IF ERRORLEVEL 1 GOTO :THREATEN_maybe_if_you_dont_give_me_something

REM DISABLED, the feature for this doesn't exist... yet!
:THREATEN_maybe_if_you_dont_give_me_something
GOTO :I_might_be_a_shard

:no_I_cant
REM Do a check so the player cant spam this to get easy affinity
IF %AFFC1_B% EQU 1 (
    GOTO :I_might_be_a_shard
) ELSE (
    SET AFFC1_B=1
    GOTO :NIC
)

:NIC
SET /A player_affinity_blacksmith=!player_affinity_blacksmith! +25
CLS
ECHO.
ECHO                                           IRON-FIST ABE
ECHO.
ECHO.
ECHO COINS: %COINS% ^| AFFINITY: %player_affinity_blacksmith%
ECHO Well, disappointing for you then. What makes you say you're a Shard then? Can you prove it?
ECHO ========================================================================================================================
ECHO Abe liked that. +25 AFFINITY
ECHO [1 // ATTEMPT TO SHRED YOUR PHYSICAL FORM] Maybe?
ECHO [2] I don't know how.
ECHO [E] Nevermind.
CHOICE /C 12E /N /M ">"
IF ERRORLEVEL 3 GOTO :blacksmith_dialogue
IF ERRORLEVEL 2 GOTO :I_dont_know_how
IF ERRORLEVEL 1 GOTO :maybe_SHRED_FORM_ATTEMPT

:maybe_SHRED_FORM_ATTEMPT
SET HP=!HP! -30
CLS
ECHO.
ECHO                                           IRON-FIST ABE
ECHO.
ECHO.
ECHO COINS: %COINS% ^| AFFINITY: %player_affinity_blacksmith%
ECHO Careful! That looked painful, I may not know much about Shards, but the little I do know...
ECHO You shred that form, or lose it, you're gone. Your soul will be returned to the... wherever they go, but that's it.
ECHO You'll be gone, never to return.
ECHO ========================================================================================================================
ECHO Damage taken! -30 HP
ECHO [E] Thanks.
CHOICE /C E /N /M ">"
IF ERRORLEVEL 1 GOTO :blacksmith_dialogue

:I_dont_know_how
CLS
ECHO.
ECHO                                           IRON-FIST ABE
ECHO.
ECHO.
ECHO COINS: %COINS% ^| AFFINITY: %player_affinity_blacksmith%
ECHO Well, if you can't do it don't bother. Maybe the Lorekeeper or that Wizard can help you.
ECHO You should go see one of them.
ECHO ========================================================================================================================
ECHO [E] Thanks.
CHOICE /C E /N /M ">"
IF ERRORLEVEL 1 GOTO :blacksmith_dialogue

:knowledge_about_memories
CLS
ECHO.
ECHO                                           IRON-FIST ABE
ECHO.
ECHO.
ECHO COINS: %COINS% ^| AFFINITY: %player_affinity_blacksmith%
ECHO Can't say that I would know much about them things... I just forge steel, that's my business.
ECHO If you want answers though? Maybe that crazed Wizard or... "Lorekeeper", or whatever would know. Talk to one of them.
ECHO ========================================================================================================================
ECHO [1] Have you seen any?
ECHO [E] Nevermind.
CHOICE /C 1E /N /M ">"
IF ERRORLEVEL 2 GOTO :blacksmith_dialogue
IF ERRORLEVEL 1 GOTO :have_you_seen_any

:have_you_seen_any
CLS
ECHO.
ECHO                                           IRON-FIST ABE
ECHO.
ECHO.
ECHO COINS: %COINS% ^| AFFINITY: %player_affinity_blacksmith%
ECHO Have I seen any? Hm... Not in recent memory... hah, no. Although there was this one time... "It", I guess,
ECHO walked in here and just... stood there? For hours, I mean just stood there. Didn't do anything.
ECHO It eventually turned around and left, but I was quaking in my boots after an encounter like that.
ECHO They look so very... lifeless, it's freaky.
ECHO ========================================================================================================================
ECHO [E] Thanks.
CHOICE /C E /N /M ">"
IF ERRORLEVEL 1 GOTO :blacksmith_dialogue