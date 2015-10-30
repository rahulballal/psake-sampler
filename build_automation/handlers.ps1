function InfoHandler {
  Write-Host $artifacts
}

function RestoreHandler {
    & $nuget restore $solution
}

function CompileHandler{
  Framework 4.5.1
  EXEC { msbuild $solution /t:Rebuild /p:Configuration=Release /v:Minimal /p:OutDir=$artifacts}
}

function UTestHandler{

}

function ITestHandler {

}

function PackHandler{

}

function ZipHandler {

}

function CleanupHandler{

}
