task default -depends cleanup,init,local

task local -depends compile,unittest,inttest,pack,zip -description "Use this task for local development purpose" -alias "lo"

task init -description "Creates initial folders inside the artifact folder" {
    Invoke-Init
}

task info -description "Check if all necessary folder structure and variables exist" {
    Get-Info
}

task  restore -description "Restore nuget packages" -alias "nres" {
    Invoke-NugetRestore
}

task compile -depends init,restore -description "Compile the configured solution" -alias "build" {
    Invoke-Compile
}

task unittest -description "Run unit tests" -alias "unit" {
    Invoke-UnitTest
}

task inttest -description "Run integration tests" -alias "int" {
    Invoke-IntTest
}

task pack -description "Create nuget packages" -alias "npac" {
    Invoke-NugetPack
}

task zip -description "Create 7zip artifact packages" -alias "7z" {
    Invoke-7Zip
}

task cleanup -description "Cleanup the output folders" -alias "clean" {
    Invoke-Cleanup
}
