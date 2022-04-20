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

$path = (Get-Alc -version $version -alternativeDownloadUrl $alternativeDownloadUrl)[1]
"$path" >> $env:GITHUB_PATH
