include ./properties.ps1
include ./handlers.ps1


task default -depends cleanup,init,local

task local -depends compile,unittest,inttest,pack,zip

task init -description "Initialize output folders"
{
    Do-Init
}

task info -description "Prints information about the current working folders"
{
    Get-Info
}

task  restore -description "Performs nuget restore"
{
    Do-NugetRestore
}

task compile -depends init,restore -description "Performs MSBuild operation"
{
    Do-Compile
}

task unittest -description "Run unit tests using configured test runner"
{
    Do-UnitTest
}

task inttest -description "Run integration tests using the configured test runner"
{
    Do-IntTest
}

task pack -description "Performs nuget pack command"
{
    Do-NugetPack
}

task zip -description "Performs nuget pack command"
{
    Do-7Zip
}

task cleanup - description 'Cleanup the output folders' 
{
    Do-Cleanup
}
