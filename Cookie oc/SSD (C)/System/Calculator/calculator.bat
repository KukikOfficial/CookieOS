@Echo off
Color e
Title Calculator
:Calculator
cls 
Echo.
Echo.
Echo.
set expr="0"
set/a answer=0
set/p expr="           Enter the expression:
set/a answer=%expr%
Echo                                     answer:%answer%
Echo.
Echo.
Echo.
Echo Press any key to clear.
Pause >nul
goto Calculator