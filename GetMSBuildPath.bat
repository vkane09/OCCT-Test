@echo off

set VSWherePath="%ProgramFiles(x86)%\Microsoft Visual Studio\Installer\vswhere.exe"

echo.
echo Search for MsBuild ...
echo.

set InstallDir="INVALID_TOKEN"


echo x64 Build. Search for VS 2022
	for /f "usebackq tokens=*" %%i in (`%VSWherePath% -latest -version 17.0^ -products * Microsoft.Component.MSBuild -property installationPath`) do (
 		set InstallDir=%%i
	)
echo %InstallDir%

set MSBuildPath=%InstallDir%\MSBuild\Current\Bin\MSBuild.exe

echo %MSBuildPath%

