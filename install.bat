@echo off

IF EXIST vpsupd.exe (
  echo Updating Avast
  start /wait vpsupd.exe /silent
)
for %%i in (npp*.exe) do (
 echo Updating Notepad++
 start /wait %%i /S
)
for %%i in (AcroRdrDC*.exe) do (
 echo Updating Acrobat Reader
 start /wait %%i /sAll
)
for %%i in (Eraser*.exe) do (
 echo Updating Eraser
 start /wait %%i --quiet
)
for %%i in (7z*.exe) do (
 echo Updating 7-zip
 start /wait %%i /S
)
if EXIST "Microsoft" (
cd Microsoft
for %%i in (*.exe) do (
 echo Updating %%i
 start /wait %%i /quiet /norestart
)
for %%i in (*.msu) do (
 echo Updating %%i
 start /wait %%i /quiet /norestart
)
for %%i in (*.msp) do (
 echo Updating %%i
 start /wait %%i /quiet /norestart
)
cd ..
echo Windows Updates finished 
)

gpupdate /force