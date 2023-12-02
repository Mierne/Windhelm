@ECHO OFF
TITLE ERROR - %errorType% (WINDHELM 1.2.1 "Build 2")
COLOR 4F
REM Error Handler v1 231126.

REM Check error type
IF %errorType% == EnemyType (
    GOTO enemyTypeError
) ELSE IF %errorType% == checkTime (
    GOTO :ctError
) ELSE (
    GOTO :EOF
)

REM Display the "Enemy Type" error.
:enemyTypeError
CLS
ECHO.
ECHO ERROR! Error Type: EnemyType.
ECHO =============================
ECHO This could mean:
ECHO The "currentEnemy" variable was left blank, or is unrecognized.
PAUSE
EXIT /B