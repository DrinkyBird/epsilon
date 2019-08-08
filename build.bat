@TITLE All Out War 2 - The Epsilon Project build script
@ECHO OFF

SET PATH=%CD%\tools;%PATH%
SET OUTDIR=%CD%\out

IF NOT EXIST "%OUTDIR%" MKDIR "%OUTDIR%"


:: Get Git informatiuon
git symbolic-ref --short HEAD > %TEMP%/Epbranch
SET /P GIT_BRANCH=<%TEMP%/Epbranch

git rev-list --count %GIT_BRANCH% > %TEMP%/Epver
SET /P GIT_NUMBER=<%TEMP%/Epver
echo %GIT_NUMBER%

IF NOT "%GIT_BRANCH%" == "master" (
    SET PK3BRANCH=-%GIT_BRANCH%
)


:: Compile ACS
acc "src\acs_source\aow2scrp.acs" "src\acs\aow2scrp.o"

:: Create the actual PK3
CD src
7za a -tzip "%OUTDIR%\aow2_epsilon%PK3BRANCH%-r%GIT_NUMBER%.pk3" *.* -r

pause