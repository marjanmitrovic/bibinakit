@echo off
setlocal EnableExtensions EnableDelayedExpansion
title Git Push - Bibi nakit

REM ===========================
REM CONFIG (edit if needed)
REM ===========================
set "REPO_URL=https://github.com/marjanmitrovic/bibinakit.git"
set "DEFAULT_MSG=Update site"

echo.
echo ==========================================
echo  Git Push (Windows) - Bibi nakit
echo ==========================================
echo.

REM Go to folder where this .bat file is located
cd /d "%~dp0"

REM Basic check: is git installed?
git --version >nul 2>&1
if errorlevel 1 (
  echo ERROR: Git is not installed or not in PATH.
  echo Install Git for Windows, then try again.
  pause
  exit /b 1
)

REM Ensure this is a git repo
if not exist ".git" (
  echo INFO: .git not found. Initializing repository...
  git init
  if errorlevel 1 (
    echo ERROR: git init failed.
    pause
    exit /b 1
  )
)

REM Ensure remote "origin" exists and is correct
git remote get-url origin >nul 2>&1
if errorlevel 1 (
  echo INFO: Adding remote origin: %REPO_URL%
  git remote add origin "%REPO_URL%"
) else (
  for /f "usebackq delims=" %%R in (`git remote get-url origin`) do set "CUR_REMOTE=%%R"
  if /I not "!CUR_REMOTE!"=="%REPO_URL%" (
    echo INFO: Updating remote origin to: %REPO_URL%
    git remote set-url origin "%REPO_URL%"
  )
)

REM Stage changes
git add .
if errorlevel 1 (
  echo ERROR: git add failed.
  pause
  exit /b 1
)

REM Ensure at least one commit exists
git rev-parse --verify HEAD >nul 2>&1
if errorlevel 1 (
  echo INFO: No commits yet. Creating initial commit...
  git commit -m "Initial commit"
) else (
  REM If user passed a message, use it; else use DEFAULT_MSG
  set "MSG=%~1"
  if "%~1"=="" set "MSG=%DEFAULT_MSG%"
  git commit -m "%MSG%" >nul 2>&1
)

REM If there was nothing to commit, git commit exits non-zero; that's OK.
REM Ensure we are on branch main
git branch -M main >nul 2>&1

REM If remote main exists, rebase before push to avoid non-fast-forward issues
git ls-remote --heads origin main | findstr /i "refs/heads/main" >nul 2>&1
if not errorlevel 1 (
  echo INFO: Pulling latest changes (rebase)...
  git pull --rebase origin main
)

echo INFO: Pushing to origin main...
git push -u origin main
if errorlevel 1 (
  echo.
  echo ERROR: Push failed.
  echo Tip: If this is a brand new repo on GitHub with files already there,
  echo run: git pull --rebase origin main
  echo then run this script again.
  pause
  exit /b 1
)

echo.
echo DONE: Push completed successfully.
echo.
pause
