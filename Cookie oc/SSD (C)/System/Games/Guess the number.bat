@echo off
title Guess the number
:menu
echo.
echo Start
echo Exit
echo.
set /p cmd=">"
if cmd==Start (goto game)
if cmd==start (goto game)
if cmd==Exit (exit)
if cmd==exit (exit)
:game

set /a number=%random% %% 100 + 1
set /a attempts=0

echo Guess the number from 1 to 100!

:guess
set /a attempts+=1
set /p guess=Your attempt: 

if %guess% equ %number% (
    echo Yay! You guessed the number %number% for %attempts% attempts!
    goto end
)

if %guess% lss %number% (
    echo The number is too small. Try it again.
    goto guess
)

if %guess% gtr %number% (
    echo It's too big a number. Try it again.
    goto guess
)

:end
echo Play again?
echo.
echo Yes
echo No
echo.
set /p cmd=">"
if cmd==Yes (goto game)
if cmd==yes (goto game)
if cmd==No (exit)
if cmd==no (exit)
pause