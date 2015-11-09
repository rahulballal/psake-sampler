import-module "./handlers.psm1"


task default -depends cleanup,init,local

task local -depends compile,unittest,inttest,pack,zip

task init {
    Invoke-Init
}

task info {
    Get-Info
}

task  restore {
    Invoke-NugetRestore
}

task compile -depends init,restore {
    Invoke-Compile
}

task unittest {
    Invoke-UnitTest
}

task inttest {
    Invoke-IntTest
}

task pack {
    Invoke-NugetPack
}

task zip {
    Invoke-7Zip
}

task cleanup -description "Cleanup the output folders" {
    Invoke-Cleanup
}
