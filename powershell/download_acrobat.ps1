$VersionURI = "https://rdc.adobe.io/reader/products?lang=en&site=enterprise&os=Windows 10&api_key=dc-get-adobereader-cdn"
$Version = (Invoke-RestMethod -Uri $VersionURI).Products.Reader.Version 
$Version = ($Version -replace '\.',$Null).Trim()

Write-Host "Downloading Version Acrobat Reader DC: $($Version)"

# Spanish version

$dlurl = "https://ardownload2.adobe.com/pub/adobe/reader/win/AcrobatDC/$Version/AcroRdrDC$($Version)_es_ES.exe"

# Downloading file under current path + updates
$cwd = (Get-Location).Path + "\updates"
$OutFile = "$($cwd)\AcroRdrDC$($Version)_es_ES.exe"

#Invoke-WebRequest -Uri $dlurl -OutFile $OutFile -Verbose

(New-Object System.Net.WebClient).DownloadFile($dlurl, $OutFile)
