$solution="../psake-sampler-ci.sln"
$artifacts= join-path -path (Get-Item $pwd).parent.FullPath -childpath artifacts
$logs="../logs"
$output="../artifacts/output"

$nuget="../tools/NuGet.CommandLine.2.8.6/tools/NuGet.exe"
$nugetTargets=@("../src/PSakeSampler.Nupkg1/PSakeSampler.Nupkg1.csproj","../src/PSakeSampler.Nupkg2/PSakeSampler.Nupkg2.csproj")

$zip="../tools/7-Zip.CommandLine.9.20.0/tools/7za.exe"
$zipTargets=@("../src/PSakeSampler.ConsoleApp/bin/Release","../src/PSakeSampler.AspNetWebApp")

$xunit="../tools/xunit.runner.console.2.1.0/tools/xunit.console.exe"
$unitTestTargets=@("../src/PSakeSampler.XunitTests/bin/Release/PSakeSampler.XunitTests.dll")
