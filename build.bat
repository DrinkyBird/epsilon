@TITLE All Out War 2 - The Epsilon Project build script
@ECHO OFF

SET PATH=%CD%\tools;%PATH%
SET OUTDIR=%CD%\out

IF "%1" == "/norev" (
    SET COMPRESSION=-mx=0
) ELSE (
    SET COMPRESSION=-mm=lzma -mx=9
)

IF NOT EXIST "%OUTDIR%" MKDIR "%OUTDIR%"


:: Get Git informatiuon
git rev-parse --abbrev-ref HEAD > %TEMP%/Epbranch
SET /P GIT_BRANCH=<%TEMP%/Epbranch

git rev-list --count %GIT_BRANCH% > %TEMP%/Epver
SET /P GIT_NUMBER=<%TEMP%/Epver
echo %GIT_NUMBER%

IF NOT "%GIT_BRANCH%" == "master" (
    SET PK3BRANCH=-%GIT_BRANCH%
)


:: Generate gitcommit.py
python "tools\gitcommit.py" "src\core\acs_source\a_gitcommit.acs"


:: Compile ACS
IF NOT EXIST "src\core\acs" MKDIR "src\core\acs"
acc "src\core\acs_source\aow2scrp.acs" "src\core\acs\aow2scrp.o"

:: Create the actual PK3s
COPY readme.txt src\core\

IF "%1" == "/norev" SET GIT_NUMBER=dev
SET OUTFILE=%OUTDIR%\aow2_epsilon%PK3BRANCH%-r%GIT_NUMBER%.pk3
SET MUSFILE=%OUTDIR%\epsilon_music%PK3BRANCH%-r%GIT_NUMBER%.pk3

IF EXIST "%OUTFILE%" DEL "%OUTFILE%"
IF EXIST "%MUSFILE%" DEL "%MUSFILE%"

PUSHD src

PUSHD core
7za a -tzip "%OUTFILE%" %COMPRESSION% *.* -r -xr!*.dbs -xr!*.backup1 -xr!*.backup2 -xr!*.backup3 -xr!*.bak
POPD

PUSHD music
7za a -tzip "%MUSFILE%" %COMPRESSION% *.* -r -xr!*.dbs -xr!*.backup1 -xr!*.backup2 -xr!*.backup3 -xr!*.bak
POPD

POPD