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
    & $nuget restore $solution
}

function CompileHandler{
  Framework $frameworkVersion
  EXEC { msbuild $solution /t:Rebuild /p:Configuration=Release /v:Minimal /p:OutDir="$artifacts/buildOutput" }
}

function UTestHandler{
  Foreach ($item in $unitTestTargets)
  {
    & $xunit $item
  }
}

function ITestHandler {
  Write-Host "Not available"
}

function PackHandler{
 Foreach ($item in $nugetTargets)
 {
   & $nuget pack $item -IncludeReferencedProjects -OutputDirectory $dist
 }
}

function ZipHandler {
  Foreach ($key in $zipTargets.Keys)
  {
    $list = $zipTargets[$key]
    Foreach ($item in $list)
    {
       & $zip a -t7z -mmt -o$artifacts $key $item
    }
  }
}

function CleanupHandler{
   if( Test-Path "$artifacts/buildOutput"){
    Remove-Item -Path "$artifacts/buildOutput" -Recurse -Verbose -Force 
   } 

   if(Test-Path "$artifacts/dist"){
    Remove-Item -Path "$artifacts/dist" -Recurse -Verbose -Force
   }

   
}

function InitHandler {
    New-Item -ItemType Directory -Force -Path $artifacts/buildOutput
    New-Item -ItemType Directory -Force -Path $artifacts/dist

}
