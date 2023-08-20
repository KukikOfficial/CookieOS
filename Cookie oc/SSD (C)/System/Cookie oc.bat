@echo off
:boot
setlocal EnableExtensions EnableDelayedExpansion
color 0a
set version=0.0.2
set build=15
=======
set version=0.0.4
set build=23
title CookieOS build %build% ver %version%
echo Finding Kernel.........
ping -n 2 0.0.0.0 >nul
echo Kernel Found!
ping -n 2 0.0.0.0 >nul
echo Loading data
ping -n 2 0.0.0.0 >nul
cls
echo Loading data.
ping -n 2 0.0.0.0 >nul
cls
echo Loading data..
ping -n 2 0.0.0.0 >nul
cls
echo Loading data...
ping -n 2 0.0.0.0 >nul
cls
echo Loading data
ping -n 2 0.0.0.0 >nul
cls
echo Loading data.
ping -n 2 0.0.0.0 >nul
cls
echo Loading data..
ping -n 2 0.0.0.0 >nul
cls
echo Loading data...
ping -n 2 0.0.0.0 >nul
if exist val.ini (
	call Load.bat
) else ( 
	goto boot
)
if %BootSeq%==BootSeqFalse (
	goto starting
)
:boot
if exist val.ini (
	call Load.bat
	goto starting
) else ( 
	goto setup
)

:setup
cls            
echo ==============================
echo        CookieOS SETUP
echo ==============================
echo.
echo What is your name?
echo.
set/p name=
echo.
cls
echo ==============================
echo        CookieOS SETUP
echo ==============================
echo.
echo Hey! %name%, Welcome to CookieOS.
echo.
set BootSeq=BootSeqTrue
set color=0a
call account.bat
:starting
cls
echo.
echo                                                                 Hello %name%
echo                                                         =============================        
echo                                                          (: Welcome to Cookie OS! :)       
echo                                                         =============================
echo.
goto OS
:OS
set /p cmd=">"
if "%cmd%"=="help" (echo HELP - help&&echo RANDOM - generating random number&&echo EXIT - exit for os&&echo cls - clear screen&&echo color - replasing color for text (colors - green,blue,pink,gold)&&echo restart - restarting system&&echo calculator - opening calculator&&echo explorer - creating explorer&&echo games - shows a list of all games
if "%cmd%"=="HELP" (echo HELP - help&&echo RANDOM - generating random number&&echo EXIT - exit for os&&echo cls - clear screen&&echo color - replasing color for text (colors - green,blue,pink,gold)&&echo restart - restarting system&&echo calculator - opening calculator&&echo explorer - creating explorer&&echo games - shows a list of all games
if "%cmd%"=="RANDOM" (echo %random%)
if "%cmd%"=="random" (echo %random%)
if "%cmd%"=="EXIT" (exit)
if "%cmd%"=="exit" (exit)
if "%cmd%"=="TIC TAC TOE" (goto tic tac toe)
if "%cmd%"=="tic tac toe" (goto tic tac toe)
if "%cmd%"=="guess the number" (start Guessthenumber)
if "%cmd%"=="GUESS THE NUMBER" (start Guessthenumber)
if "%cmd%"=="cls" (cls)
if "%cmd%"=="color gold" (color 6)
if "%cmd%"=="color green" (color 2)
if "%cmd%"=="color pink" (color c)
if "%cmd%"=="color blue" (color 1)
if "%cmd%"=="restart" (goto boot)
if "%cmd%"=="calc" (start calculator)
if "%cmd%"=="CALC" (start calculator)
if "%cmd%"=="calculator" (start calculator)
if "%cmd%"=="CALCULATOR" (start calculator)
if "%cmd%"=="explorer" (goto create)
if "%cmd%"=="EXPLORER" (goto create)
if "%cmd%"=="txt" (goto txt)
if "%cmd%"=="TXT" (goto txt)
if "%cmd%"=="KUK!" (echo mmm, secret phrase... IM'A KUKIK!)
if "%cmd%"=="games" (echo list of games - tic tac toe, guess the number, minesweeper)
if "%cmd%"=="GAMES" (echo list of games - tic tac toe, guess the number, minesweeper)
if "%cmd%"=="minesweeper" (goto test_minesweep)
if "%cmd%"=="MINESWEEPER" (goto test_minesweep)
if "%cmd%"=="info" (echo Current Directory:%mypath% Version:%version% Build:%build%)
if "%cmd%"=="time" (start info)
goto OS
:tic tac toe
start tictactoe
goto OS
:create
set /p name="Enter explorer name >"
if "%name%"=="%name%" (md %name%)
goto OS
:txt
set /p name=Enter the name for your file >
set /p ext=Enter the extension for your file >
goto OS

:test_minesweep
@echo off
setlocal enabledelayedexpansion
for /f "delims=" %%g in ('forfiles /p "%~dp0." /m "%~nx0" /c "cmd /c echo(0x1B"') do set "esc=%%g"
echo %esc%[?25l
(set lf=^
%=%
)

set game[1]="height=9,width=9,mines=10"
set game[2]="height=16,width=16,mines=40"
set game[3]="height=16,width=30,mines=99"

set "zero=0"
set "move[1]=x l zero height -1"
set "move[2]=y l zero width -1"
set "move[3]=x g height zero 1"
set "move[4]=y g width zero 1"

set "count=0"
for %%g in (30 94 92 91 34 31 96 97 37) do (
    set "c[!count!]=%esc%[%%gm!count!%esc%[0m"
    set /a "count+=1"
)
set "c[-]=%esc%[7;31mX%esc%[0m"

rem Gamemode Selector
:a
cls
echo 1^) Beginner!lf!2^) Intermediate!lf!3^) Expert!lf!4^) Exit
choice /c 1234 /n >nul
if !errorlevel! equ 4 exit
set /a "!game[%errorlevel%]!"
set /a "area=(width*height)-1"

set /a "x=0,y=0,z=1"
set "string0=#"
set "string1=#"

rem Preprocessor
set "row=^^^!b^!h^!`!width!^^^!"
set /a "height-=1"
for /l %%g in (0,1,!height!) do (
    for /l %%h in (0,1,!width!) do set "b%%g`%%h= "
)
set /a "width-=1"
for /l %%g in (0,1,!height!) do (
    for /l %%h in (0,1,!width!) do (
        set "a[%%g`%%h]=0"
        set "d%%g`%%h=%esc%[90m?%esc%[0m"
        set "string0=!string0!%%g`%%h#"
    )
)
set /a "mines-=1"
for /l %%g in (!width!,-1,0) do set "row=^^^!b^!h^!`%%g^^^!^^^!d^!h^!`%%g^^^!!row!"

cls
:b
call :board
choice /c wasdq /n >nul
if "!errorlevel!" neq "5" (
    call :move !move[%errorlevel%]!
    goto b
)

rem Digitizer
set /a "win_con=area-mines"
for %%g in (0 1 2) do set "digit%%g=!area:~%%g,1!"

rem Excluder
for %%g in (-1 0 1) do (
    for %%h in (-1 0 1) do (
        set /a "m=x+%%g,n=y+%%h"
        if !m! geq 0 (
            if !m! leq !height! (
                if !n! geq 0 (
                    if !n! leq !width! (
                        set /a "area-=1"
                        for %%i in ("!m!`!n!") do set "string0=!string0:#%%~i#=#!"
                    )
                )
            )
        )
    )
)

rem Sets h array, improvement possible
set /a "digit0-=1"
for /l %%g in (0,1,!digit0!) do (
    for /l %%h in (0,1,9) do (
        for /l %%i in (0,1,9) do (
            for /f "tokens=1 delims=#" %%j in ("!string0!") do (
                set "h[%%g%%h%%i]=%%~j"
                set "string0=!string0:#%%~j#=#!"
                set "string1=!string1!%%g%%h%%i#"
            )
        )
    )
)
set /a "digit0+=1,digit1-=1"
for /l %%g in (0,1,!digit1!) do (
    for /l %%h in (0,1,9) do (
        for /f "tokens=1 delims=#" %%i in ("!string0!") do (
            set "h[!digit0!%%g%%h]=%%~i"
            set "string0=!string0:#%%~i#=#!"
            set "string1=!string1!!digit0!%%g%%h#"
        )
    )
)
set /a "digit1+=1"
for /l %%g in (0,1,!digit2!) do (
    for /f "tokens=1 delims=#" %%h in ("!string0!") do (
        set "h[!digit0!!digit1!%%g]=%%~h"
        set "string0=!string0:#%%~h#=#!"
        set "string1=!string1!!digit0!!digit1!%%g#"
    )
)

rem Randomizer and Incrementer
set "string0="
for /l %%g in (0,1,!mines!) do (
    set /a "rand=4*(!random! %% !area!)+1, area-=1"
    for %%h in (!rand!) do (
        for /f %%i in ("!string1:~%%h,3!") do (
            set "a[!h[%%~i]!]=-10"
            set "string1=!string1:#%%~i#=#!"
            set "string0=!string0!!h[%%i]! "
            for /f "tokens=1,2 delims=`" %%j in ("!h[%%i]!") do (
                for %%l in (-1 0 1) do (
                    for %%m in (-1 0 1) do (
                        set /a "m=%%j+%%l,n=%%k+%%m"
                        if !m! geq 0 (
                            if !m! leq !height! (
                                if !n! geq 0 (
                                    if !n! leq !width! set /a "a[!m!`!n!]+=1"
                                )
                            )
                        )
                    )
                )
            )
        )
    )
)

rem Colorizer
for /l %%g in (0,1,!height!) do (
    for /l %%h in (0,1,!width!) do (
        for /f %%i in ("!a[%%g`%%h]:~0,1!") do set "a[%%g`%%h]=!c[%%i]!"
    )
)

set "list=#!x!`!y!#"
set "done=#"
call :zero_chaining

:main
call :board
choice /c wasdqe /n >nul
if !errorlevel! leq 4 (
    call :move !move[%errorlevel%]!
) else if !errorlevel! equ 5 (
    call :dig
) else call :flag
goto main

:move
if !%1! %2eq !%3! (
    set "%1=!%4!"
) else set /a "%1+=%5"
set /a "z=y+1"
exit /b

rem Improvement possible
:dig
for /f %%g in ("!x!`!y!") do (
    if "!d%%~g:~5,1!" equ "?" (
        if "!a[%%~g]:~7,1!" neq "X" (
            if "!a[%%~g]:~5,1!" equ "0" (
                set "list=#!x!`!y!#"
                call :zero_chaining
            ) else (
                set "d%%~g=!a[%%~g]!"
                set /a "win_con-=1"
            )
            if !win_con! equ 0 (
                call :board
                echo You win
                choice /c q /n >nul
                goto a
            )
        ) else (
            for %%h in (!string0!) do (
                set "d%%h=!a[%%h]!"
            )
            call :board
            echo You lose
            choice /c q /n >nul
            goto a
        )
    )
)
exit /b

:flag
for /f %%g in ("!x!`!y!") do (
    if "!d%%~g:~5,1!" equ "?" (
        set "d%%g=P"
    ) else if "!d%%g!" equ "P" (
        set "d%%g=%esc%[90m?%esc%[0m"
    )
)
exit /b

:zero_chaining
for /f "tokens=1 delims=#" %%g in ("!list!") do (
    set "list=!list:#%%~g#=#!"
    set "done=!done!%%g#"
    for /f "tokens=1,2 delims=`" %%h in ("%%~g") do (
        for %%j in (-1 0 1) do (
            for %%k in (-1 0 1) do (
                set /a "m=%%h+%%j,n=%%i+%%k"
                for %%l in ("!m!`!n!") do (
                    if !m! geq 0 (
                        if !m! leq !height! (
                            if !n! geq 0 (
                                if !n! leq !width! (
                                    if "!d%%~l:~5,1!" equ "?" (
                                        set "d%%~l=!a[%%~l]!"
                                        set /a "win_con-=1"
                                        if "!a[%%~l]:~5,1!" equ "0" (
                                            if "!list:#%%~l#=#!" equ "!list!" (
                                                if "!done:#%%~l#=#!" equ "!done!" set "list=!list!%%~l#"
                                            )
                                        )
                                    )
                                )
                            )
                        )
                    )
                )
            )
        )
    )
)
if "!list:#=!" neq "" goto :zero_chaining
exit /b

:board
set "b!x!`!y!=["
set "b!x!`!z!=]"
set "board="
for /l %%g in (0,1,!height!) do (
    set "h=%%g"
    set "board=!board!%row%^!lf^!"
)
echo %esc%[1;1H%board%
set "b!x!`!y!= "
set "b!x!`!z!= "
exit /b


