function Get-Alc {
    [CmdletBinding()]
    param (
        [Parameter()]
        [string]
        $version,
        [Parameter()]
        [string]
        $alternativeDownloadUrl
    )
    [OutputType([string])]
    # Download URL for ALC portable:
	$Url = "https://marketplace.visualstudio.com/_apis/public/gallery/publishers/ms-dynamics-smb/vsextensions/al/$version/vspackage" 

    if($alternativeDownloadUrl) {
        $Url = $alternativeDownloadUrl
    }
	
	# Download destination (root of PowerShell script execution path):
	$DownloadPathDestination = join-path (get-location) "alc"
	
    if(Test-Path $DownloadPathDestination) {
        Remove-Item -fo -r $DownloadPathDestination
    }
    
    New-Item -ItemType Directory $DownloadPathDestination
    
    $DownloadZipDestination = join-path $DownloadPathDestination "alc.zip"
    if(Test-Path $DownloadZipDestination) {
        Remove-Item -fo $DownloadZipDestination
    }
    
    # Download from GitHub:
    Invoke-WebRequest -Uri $Url -OutFile $DownloadZipDestination

    # Unzip alc portable, and then delete the zip file:
    Expand-Archive -Path $DownloadZipDestination -DestinationPath $DownloadPathDestination
    Remove-Item $DownloadZipDestination

    $alcPath = join-path $DownloadPathDestination "extension\bin\win32\"
    return $alcPath
}

Export-ModuleMember -Function Get-Alc
