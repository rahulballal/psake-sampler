function InfoHandler {
  Write-Host $rootDir "Exists : " (test-path -path $rootDir)
  Write-Host $solution "Exists : " (test-path -path $solution)
  Write-Host $artifacts "Exists : " (test-path -path $artifacts)
  Write-Host $logs "Exists : " (test-path -path $logs)
  Write-Host $nuget "Exists : " (test-path -path $nuget)
  Write-Host $zip "Exists : " (test-path -path $zip)
  Write-Host $xunit "Exists : " (test-path -path $xunit)
}

function RestoreHandler {
    exec {
        &$nuget restore $solution
    }

}

function CompileHandler{
  Framework $frameworkVersion
  EXEC { msbuild $solution /t:$buildTarget /p:Configuration=$buildConfiguration /v:$buildVerbosity /p:OutDir=$buildOutput }
}

function UTestHandler{
  Foreach ($item in $unitTestTargets)
  {
  EXEC {
    &$xunit $item }
  }
}

function ITestHandler {
  Write-Host "Not available"
}

function PackHandler{
 Foreach ($item in $nugetTargets)
 {
  EXEC{
   &$nuget pack $item -IncludeReferencedProjects -Build -OutputDirectory $dist
  }
 }
}

function ZipHandler {
  Foreach ($key in $zipTargets.Keys)
  {
    $list = $zipTargets[$key]
    Foreach ($item in $list)
    {
      exec { &$zip a -t7z -mmt -o$artifacts $key $item }
    }
  }
}

function CleanupHandler{
   if( Test-Path $buildOutput){
    Remove-Item -Path $buildOutput -Recurse  -Force
   }

   if(Test-Path $dist){
    Remove-Item -Path $dist -Recurse  -Force
   }


}

function InitHandler {
    New-Item -ItemType Directory -Force -Path $buildOutput
    New-Item -ItemType Directory -Force -Path $dist

}
