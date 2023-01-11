@echo off

call "%~dp0GetMsBuildPath.bat" MSBuildPath


echo --------------------------------------------------------------------------------
echo.
echo Build Debug/x64 composition
echo.


"%MSBuildPath%" /property:Configuration="Debug" /property:Platform="x64" /maxcpucount /p:BuildInParallel=true FirstOCCT.sln

set BUILD_STATUS=%ERRORLEVEL%
if %BUILD_STATUS%==0 goto end

:fail
echo.
echo Build composition Debug/x64 failed
echo.
echo --------------------------------------------------------------------------------

if not "%arg1%" == "NOWAIT" pause
exit /b 1

:end
echo.
echo Build composition Debug/x64 successful
echo.
echo --------------------------------------------------------------------------------

if not "%arg1%" == "NOWAIT" pause
exit /b 0


