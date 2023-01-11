@echo off

call "%~dp0GetMsBuildPath.bat" MSBuildPath

call "%MSBuildPath%" /property:Configuration="Debug" /property:Platform="x64" /t:Clean FirstOCCT.sln
call "%MSBuildPath%" /property:Configuration="Release" /property:Platform="x64" /t:Clean FirstOCCT.sln


rem ============================================================
echo Clean global bin
echo.
del "%~dp0bin\x64\Debug\*.*" /q
rd "%~dp0bin\x64\Debug" /s /q

del "%~dp0bin\x64\Release\*.*" /q
rd "%~dp0bin\x64\Release" /s /q

rd "%~dp0bin" /s /q
rem ============================================================

rem ============================================================
echo Clean obj
echo.

for /d %%i in (.\obj\*) do (
	rd "%%i" /s /q
)

rd "%~dp0obj /s /q
rem ============================================================

echo.
echo build cleaned
echo.
echo --------------------------------------------------------------------------------


if not "%1" == "NOWAIT" pause
