# Set TLS support for Powershell and parse the JSON request
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$dlurl = 'http://download.windowsupdate.com/microsoftupdate/v6/wsusscan/wsusscn2.cab' 

# Downloading file under current path + updates
$cwd = (Get-Location).Path + "\updates"
$OutFile = "$($cwd)\wsusscn2.cab"

$ProgressPreference = 'SilentlyContinue'

Write-Host "Downloading..."

Invoke-WebRequest -Uri $dlurl -OutFile $OutFile -Verbose -Useragent wget

