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
if exist account.ini (
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
if "%cmd%"=="minesweeper" (start minesweeper)
if "%cmd%"=="MINESWEEPER" (start minesweeper)
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
