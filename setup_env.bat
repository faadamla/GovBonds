@echo off
REM setup_env.bat — create .venv, install requirements, and run env check
setlocal enabledelayedexpansion
echo.
echo === GovBonds: setup_env.bat ===

REM Ensure python is available
where python >nul 2>&1
if errorlevel 1 (
  echo ERROR: python not found on PATH. Install Python or run this script from a Python-enabled shell.
  exit /b 1
)

REM Create venv if missing
echo Checking for .venv...
if not exist "%~dp0.venv\Scripts\python.exe" (
  echo Creating virtual environment at .venv...
  call python -m venv "%~dp0.venv"
  if errorlevel 1 (
    echo Failed to create virtual environment
    exit /b 1
  )
) else (
  echo .venv already exists, skipping creation.
)

REM Upgrade pip and install requirements
echo Installing dependencies into .venv...
call "%~dp0.venv\Scripts\python.exe" -m pip install --upgrade pip setuptools wheel >nul
if errorlevel 1 (
  echo pip upgrade failed
  exit /b 1
)

if exist "%~dp0requirements.txt" (
  goto INSTALL_REQS
) else (
  goto INSTALL_MIN
)

:INSTALL_REQS
echo Found requirements.txt — installing packages...
call "%~dp0.venv\Scripts\python.exe" -m pip install -r "%~dp0requirements.txt"
if errorlevel 1 (
  echo pip install failed
  exit /b 1
)
goto AFTER_PIP

:INSTALL_MIN
echo requirements.txt not found — installing minimal deps (pandas, numpy, openpyxl)...
call "%~dp0.venv\Scripts\python.exe" -m pip install pandas numpy openpyxl
if errorlevel 1 (
  echo pip install failed
  exit /b 1
)
goto AFTER_PIP

:AFTER_PIP

REM Run the environment check script
echo Running environment check (scripts\check_env.py)...
if exist "%~dp0scripts\check_env.py" (
  call "%~dp0.venv\Scripts\python.exe" "%~dp0scripts\check_env.py"
  if errorlevel 1 (
    echo Environment check failed
    exit /b 1
  )
) else (
  echo No scripts\check_env.py found — please add one to validate the environment.
  exit /b 1
)

echo.
echo Setup complete — virtual environment ready.
endlocal
exit /b 0
