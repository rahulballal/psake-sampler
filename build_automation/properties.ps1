properties {

    $frameworkVersion="4.5.1"
    $buildConfiguration="Release"
    $buildTarget="Rebuild"
        
    # available values are "Detailed" "Diagnostic" "Minimal" "Normal" "Quiet"
    $buildVerbosity="Minimal"
    # options are x86 or x64 or Any CPU
    $buildPlatform="Any CPU"
    $solution=(Get-Item "../psake-sampler-ci.sln").FullName
    $rootDir=(Get-Item $solution).Directory
    $artifacts= join-path -path (Get-Item $solution).Directory -childpath artifact
    $buildOutput="$artifacts/buildOutput"
    $dist="$artifacts/dist"
    $logs= join-path -path $rootDir -childpath logs


    $nuget= join-path -path $rootDir -childpath "tools/NuGet.CommandLine.2.8.6/tools/NuGet.exe"
    $nugetTargets=@("../src/PSakeSampler.Nupkg1/PSakeSampler.Nupkg1.csproj","../src/PSakeSampler.Nupkg2/PSakeSampler.Nupkg2.csproj")

    $zip= join-path -path $rootDir -childpath "tools/7-Zip.CommandLine.9.20.0/tools/7za.exe"

    $key1 = "$dist/PSakeSampler.ConsoleApp.7z"
    $fileList1 = @( "$buildOutput/PSakeSampler.ConsoleApp.exe" , "$buildOutput/PSakeSampler.ConsoleApp.exe.config")

    $key2 = "$dist/PSakeSampler.WebApp.7z"
    $fileList2 = @("$buildOutput/_PublishedWebsites/PSakeSampler.AspNetWebApp")

    $zipTargets=@{$key1 = $fileList1
                  $key2 =$fileList2}

    $xunit= join-path -path $rootDir -childpath "tools/xunit.runner.console.2.1.0/tools/xunit.console.exe"
    $xunitTestDll= "$buildOutput/PSakeSampler.XunitTests.dll"
    $unitTestTargets=@($xunitTestDll)

}
