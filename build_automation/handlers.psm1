# dot(.) sourcing the properies file
. ./properties.ps1

function Get-Info
{
  $dirs = $rootDir, $solution, $artifacts, $logs, $nuget,$zip,$xunit
  foreach ($item in $dirs)
  {
    if (test-path -path $item)
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
  exec { msbuild $solution /t:$buildTarget /p:Configuration=$buildConfiguration /v:"$buildVerbosity" /p:OutDir=$buildOutput /p:Platform=$buildPlatform  }
}

function Invoke-UnitTest
{
  foreach ($item in $unitTestTargets)
  {
  exec {
      &$xunit $item 
    }
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
   foreach ($item in $nugetTargets)
   {
    exec{
     &$nuget pack $item -IncludeReferencedProjects -Build -OutputDirectory $dist
    }
   }
}

function Invoke-7Zip
{
  foreach($key in $zipTargets.Keys)
  {
    $list = $zipTargets[$key]
    foreach ($item in $list)
    {
      exec { &$zip a -t7z -mmt -o$artifacts $key $item }
    }
  }
}

export-modulemember -function Get-Info, Invoke-Init, Invoke-Cleanup, Invoke-7Zip, Invoke-Compile, Invoke-IntTest, Invoke-UnitTest, Invoke-NugetPack, Invoke-NugetRestore
