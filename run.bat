@echo off
cls

:: Create bin directory if it doesn't exist
if not exist bin mkdir bin

:: Default action: build_and_run
set action=build_and_run

:: Check command-line arguments
if "%1"=="build" set action=build
if "%1"=="run" set action=run
if "%1"=="clean" set action=clean

:: Clean action
if "%action%"=="clean" (
  echo Cleaning up...
  rmdir /s /q bin
  echo Bin directory cleaned.
  pause
  cls
  exit /b 0
)

:: Get start time
set "start=%time%"

:: Build action
if "%action%"=="build" or "%action%"=="build_and_run" (
  gcc src\main.c lib\helper.c -I lib -o bin\app.exe
  if %errorlevel% neq 0 (
    echo Compilation failed.
    exit /b 1
    ) else (
    echo Build successful.
  )
)

:: Run action
if "%action%"=="run" or "%action%"=="build_and_run" (
  cls
  bin\app.exe
  echo.
  
  :: Get end time
  set "end=%time%"
  
  :: Normalize and calculate elapsed time
  for /f "tokens=1-4 delims=:." %%A in ("%start%") do (
    set /a "start_ms=(((%%A*60)+%%B)*60+%%C)*100+%%D"
  )
  for /f "tokens=1-4 delims=:." %%A in ("%end%") do (
    set /a "end_ms=(((%%A*60)+%%B)*60+%%C)*100+%%D"
  )
  
  :: Calculate elapsed time in seconds (as integer part)
  set /a "elapsed_int=(end_ms - start_ms) / 100"

  :: Calculate elapsed time in milliseconds (decimal part)
  set /a "elapsed_ms=(end_ms - start_ms) %% 100"

  :: Display elapsed time as float
  echo Program executed in %elapsed_int%.%elapsed_ms% seconds
)

pause
cls
