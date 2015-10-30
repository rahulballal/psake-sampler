. ./properties.ps1
. ./handlers.ps1

task default -depends hello

task hello {
	Handle-Hello
}

task hello2{
	Write-Host "Yup"
}
