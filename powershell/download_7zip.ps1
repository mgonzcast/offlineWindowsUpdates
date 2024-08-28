# Set TLS support for Powershell and parse the JSON request
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$dlurl = 'https://7-zip.org/' + (Invoke-WebRequest -UseBasicParsing -Uri 'https://7-zip.org/' | Select-Object -ExpandProperty Links | Where-Object {($_.outerHTML -match 'Download')-and ($_.href -like "a/*") -and ($_.href -like "*-x64.exe")} | Select-Object -First 1 | Select-Object -ExpandProperty href)

# modified to work without IE
# above code from: https://perplexity.nl/windows-powershell/installing-or-updating-7-zip-using-powershell/
#$installerPath = Join-Path $env:TEMP (Split-Path $dlurl -Leaf)

# Downloading file under current path + updates
$cwd = (Get-Location).Path + "\updates"
$OutFile = Join-Path $cwd (Split-Path $dlurl -Leaf)

#Invoke-WebRequest $dlurl -OutFile $OutFile

Write-Host "Downloading 7-zip..."

(New-Object System.Net.WebClient).DownloadFile($dlurl, $OutFile)
