@echo off

mkdir updates
mkdir updates\Microsoft

copy install.bat updates > NUL

Powershell -noprofile -executionpolicy unrestricted -File .\powershell\download_wsusscn2.ps1
Powershell -noprofile -executionpolicy unrestricted -File .\powershell\download_windows_updates.ps1
Powershell -noprofile -executionpolicy unrestricted -File .\powershell\download_7zip.ps1 
Powershell -noprofile -executionpolicy unrestricted -File .\powershell\download_acrobat.ps1
Powershell -noprofile -executionpolicy unrestricted -File .\powershell\download_avast.ps1

cd updates\Microsoft

for %%i in (*.cab) do (
 echo Extracting file %%i
 expand %%i -F:*.msp .\
 del %%i
)

cd ..\..


FOR /f %%a IN ('WMIC OS GET LocalDateTime ^| FIND "."') DO SET DTS=%%a
SET DateTime=%DTS:~0,8%
ren updates "updates-%DateTime%"
