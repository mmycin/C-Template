@echo off
cls
if not exist bin mkdir bin

gcc main.c -o bin\app.exe
if %errorlevel% neq 0 (
    echo Compilation failed.
    exit /b 1
)

bin\app.exe
pause
cls