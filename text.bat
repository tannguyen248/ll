REM set currentBranch=git name-rev --name-only HEAD
for /f %%i in ('git name-rev --name-only HEAD') do set currentBranch=%%i

REM stash the current working
git stash

REM switch to develop
git checkout master

REM shouldn not change anything in local develop => should not have conflict
git pull --rebase
git checkout %currentBranch%

git stash pop

pause