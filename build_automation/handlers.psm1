# dot(.) sourcing the properies file
. ./properties.ps1

function Get-Info
{
  $dirs = $rootDir, $solution, $artifacts, $logs, $nuget,$zip,$xunit
  Foreach ($item in $dirs)
  {
    If (test-path -path $item)
    {
      Write-Output "$item Exists"
    }
  }
}

function Invoke-Cleanup
{
   if( Test-Path $buildOutput){
    Remove-Item -Path $buildOutput -Recurse  -Force
   }

   if(Test-Path $dist){
    Remove-Item -Path $dist -Recurse  -Force
   }
}

function Invoke-Init
{
    New-Item -ItemType Directory -Force -Path $buildOutput
    New-Item -ItemType Directory -Force -Path $dist
}

function Invoke-Compile
{
  Framework $frameworkVersion
  EXEC { msbuild $solution /t:$buildTarget /p:Configuration=$buildConfiguration /v:$buildVerbosity /p:OutDir=$buildOutput /p:Platform=$buildPlatform }
}

function Invoke-UnitTest
{
  Foreach ($item in $unitTestTargets)
  {
  EXEC {
    &$xunit $item }
  }
}

function Invoke-IntTest
{
  Write-Output "Task Not Implemented"
}

function Invoke-NugetRestore
{
    exec {
        &$nuget restore $solution
    }
}

function Invoke-NugetPack
{
   Foreach ($item in $nugetTargets)
   {
    EXEC{
     &$nuget pack $item -IncludeReferencedProjects -Build -OutputDirectory $dist
    }
   }
}

function Invoke-7Zip
{
  Foreach ($key in $zipTargets.Keys)
  {
    $list = $zipTargets[$key]
    Foreach ($item in $list)
    {
      exec { &$zip a -t7z -mmt -o$artifacts $key $item }
    }
  }
}
