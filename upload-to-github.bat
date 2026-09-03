@echo off
setlocal
cd /d "%~dp0"

echo ================================
echo GitHub Pages Upload
echo ================================
echo.

git status --short
if errorlevel 1 goto :error

echo.
git add .
if errorlevel 1 goto :error

set "commitMessage=Website aktualisieren"
if not "%~1"=="" set "commitMessage=%~1"

git diff --cached --quiet
if not errorlevel 1 (
    echo Keine neuen Aenderungen vorhanden.
    goto :push
)

git commit -m "%commitMessage%"
if errorlevel 1 goto :error

:push
git push origin main
if errorlevel 1 goto :error

echo.
echo Upload erfolgreich.
echo GitHub Pages braucht eventuell 1-2 Minuten.
goto :done

:error
echo.
echo FEHLER: Der Upload konnte nicht abgeschlossen werden.
goto :done

:done
pause
endlocal
