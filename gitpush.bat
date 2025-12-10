@echo off
title Git Push - Bibi nakit

echo ===============================
echo   GIT PUSH - BIBI NAKIT SAJT
echo ===============================
echo.

:: Udji u folder gde se nalazi ovaj .bat
cd /d "%~dp0"

:: Provera da li je ovo Git repo
if not exist .git (
    echo [GRESKA] Ovaj folder nije Git repozitorijum!
    echo Proveri da li se .bat fajl nalazi u glavnom folderu projekta.
    pause
    exit /b
)

echo Dodajem izmene...
git add .

echo.
echo Pravimo commit...
git commit -m "Update sajta"

echo.
echo Saljemo na GitHub...
git push origin main

echo.
echo ===============================
echo   Push je zavrsen!
echo ===============================
echo.

pause
