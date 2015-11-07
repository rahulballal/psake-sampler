include ./properties.ps1
include ./handlers.ps1


task default -depends cleanup,init,local

task local -depends restore,compile,unittest,inttest,pack,zip

task init {
    InitHandler
}

task info{
  InfoHandler
}

task  restore{
    RestoreHandler
}

task compile{
    CompileHandler
}

task unittest{
  UTestHandler
}

task inttest{
  ITestHandler
}

task pack{
  PackHandler
}

task zip{
  ZipHandler
}

task cleanup{
  CleanupHandler
}
