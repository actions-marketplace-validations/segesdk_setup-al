param (
    [Parameter()]
    [string]
    $version = "9.0.605172"
)

$here = Split-Path $MyInvocation.MyCommand.Definition
$modulePath = Join-Path -Path $here -ChildPath 'AL-Lib.psm1'
Import-Module $modulePath -Force
$path = Get-Alc
$Env:PATH += ";$path"
$Env:PATH