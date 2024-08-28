# Set TLS support for Powershell and parse the JSON request
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

Write-Host "Downloading Avast..."

$dlurl="https://www.avast.com/download-thank-you.php?product=VPS18&locale=en-ww&direct=1"
$OutFile = (Get-Location).Path + "\updates\vpsupd.exe"


# Descargamos desde la URL con el nombre en installerPath
#Invoke-WebRequest -UseBasicParsing "https://www.avast.com/download-thank-you.php?product=VPS18&locale=en-ww&direct=1" -


(New-Object System.Net.WebClient).DownloadFile($dlurl, $OutFile)

