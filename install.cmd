@echo off
IF EXIST "%SystemDrive%\Chocolatey" (
	CALL cver | find "-azure"
	IF ERRORLEVEL 1 (
		ECHO You have a non-Azure version of Chocolatey installed. As of 0.9.8.23  it is unable to authenticate to internal sources. You should uninstall Chocolatey and re-run this batch file.
		EXIT /B 1
	)
)

call cinst chocolatey -source http://wanuget/bootstrap/api/v2/ -prerelease
call choco sources | find "WABootstrap"
IF ERRORLEVEL 1 (
	call choco sources add -name WABootstrap -source http://wanuget/bootstrap/api/v2/
)

call cinst %dp0\packages.config