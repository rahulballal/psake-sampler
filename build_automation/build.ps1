. ./properties.ps1
. ./handlers.ps1


task default -depends local

task local -depends restore,compile,utest,itest,pack,zip

task  restore{
    RestoreHandler
}

task compile{

}

task utest{

}

task itest{

}

task pack{

}

task zip{

}

task cleanup{

}
