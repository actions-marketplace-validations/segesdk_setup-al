param (
    [Parameter()]
    [string]
    $version = "9.0.605172",
    [Parameter()]
    [string]
    $alternativeDownloadUrl
)

$here = Split-Path $MyInvocation.MyCommand.Definition
$modulePath = Join-Path -Path $here -ChildPath 'AL-Lib.psm1'
Import-Module $modulePath -Force

$Env:PATH
$path = (Get-Alc -version $version -alternativeDownloadUrl $alternativeDownloadUrl)[1]
$Env:PATH += 
$env:path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User") + ";" + $path
$Env:PATH
refreshenv