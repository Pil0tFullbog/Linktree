@echo off
setlocal
cd /d "%~dp0"

git status --short
if errorlevel 1 goto :error

git add .
if errorlevel 1 goto :error

set "commitMessage=Website aktualisieren"
if not "%~1"=="" set "commitMessage=%~1"

git diff --cached --quiet
if not errorlevel 1 (
    goto :push
)

git commit -m "%commitMessage%"
if errorlevel 1 goto :error

:push
git push origin main
if errorlevel 1 goto :error

goto :done

:error
goto :done

:done
pause
endlocal
