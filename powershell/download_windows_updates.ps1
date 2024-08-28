param (
[Parameter(Mandatory=$false)][Int32]$Month)


$Windows_updates_search="Security windows 10 1809 x64"
$KB890830_search="890830 windows 10 x64"
$Office_search="Office 2016 32 bits"


# Set TLS support for Powershell and parse the JSON request
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$cwd = (Get-Location).Path
$MSCatalogModule = "$($cwd)\powershell\MSCatalog\MSCatalog.psm1"


Import-Module $MSCatalogModule

# If parameter $Month is not passed, it gets current month

if (!$PSBoundParameters.ContainsKey('Month'))
{
	$Month=(Get-Date -Format MM)
}

$Year=(Get-Date).Year|Out-String -Stream

$Date=($Month).ToString('00') + "/" + $Year

Write-Host "`r`n---------------------------------------------------------"
Write-Host "`tDownloading updates since: $Date"
Write-Host "---------------------------------------------------------"

# Downloading file under current path + updates
$OutFolder = "$($cwd)\updates\Microsoft"

# Downloading Microsoft windows updates

$Updates=Get-MSCatalogUpdate -AllPages -Search $Windows_updates_search | Where-Object {$_.LastUpdated -ge $Date}

if ($Updates -eq $null){ Write-Host "`r`nThere is no Windows updates for $Date"} else {
	Write-Host "`r`nDownloading the following windows updates: "
	$Updates
	Write-Host "Downloading..."
	Foreach ($item in $Updates) { Save-MSCatalogUpdate -AcceptMultiFileUpdates -Update $item -Destination $OutFolder }
}

# Downloading Latest malware removal tool KB890830 

$UpdateMalware=Get-MSCatalogUpdate -Search $KB890830_search | Where-Object {$_.LastUpdated -ge (Get-Date).ToString("MM/yyyy")}

if ($UpdateMalware -eq $null){ Write-Host "`r`nMalware removal tool can´t be found"} else {
	Write-Host "`r`nDownloading malware removal tool:"
	$UpdateMalware
	Write-Host "Downloading..."
	Save-MSCatalogUpdate -Update $UpdateMalware -Destination $OutFolder -ErrorAction SilentlyContinue
}

# Downloading Office updates 

$UpdatesOffice=Get-MSCatalogUpdate -AllPages -Search $Office_search | Where-Object {$_.LastUpdated -ge $Date}


if ($UpdatesOffice -eq $null){ Write-Host "There is no Office updates for $Date"}
else {
	Write-Host "`r`nDownloading the following Office updates: "
	$UpdatesOffice
	Write-Host "Downloading..."
	Foreach ($item in $UpdatesOffice) { Save-MSCatalogUpdate -AcceptMultiFileUpdates -Update $item -Destination $OutFolder -Language "es-es" -ErrorAction SilentlyContinue }
}

