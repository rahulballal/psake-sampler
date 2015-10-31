# psake-sampler
All things [psake](https://github.com/psake/psake)

<img src="https://ci.appveyor.com/project/rahulballal/psake-sampler/branch/master" >

## Folder Structure (Derived from [repo-templify](https://github.com/rahulballal/repo-templify.git))

- artifact
	- buildOutput		# created at runtime, sln build output is dumped here
	- dist				# created at runtime, all .nupkg and 7z files are dumped here
- build_automation
	- build.ps1			# PSake tasks and dependency setup
	- handlers.ps1		# Powershell functions that the tasks call to do the work
	- init.ps1			# ps1 file used by psake internally
	- properties.ps1	# A set of configurable properties for our build system, TODO : add parameters for runtime tweaks
	- psake.cmd 		# Windows cmd file to wrap psake invocation
	- psake.ps1			# Psake as a powershell file
	- psake.psm1		# Psake as a powershell module
	- psake-config.ps1  # Psake's configuration file
- logs					# Any logs created at runtime are dumped here
- src 					# All csproj live here
- tools					# Home for all build dependency tools
	- 7-Zip.CommandLine.9.20.0\tools\7za.exe 	# 7Zip Exe
	- NuGet.CommandLine.2.8.6\tools\NuGet.exe 	# Nuget Exe
	- xunit.runner.console.2.1.0\tools\xunit.console.exe 	# XUnit Test Runner, folder has other XUnit dependencies
- psake-sampler-ci.sln 	# Main sln file
- README.md 			# Readme
