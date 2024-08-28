# offlineWindowsUpdates

This is a set of scripts for downloading offline Windows and Office updates for Windows 10 machines not connected to the Internet

It is based on the [MSCatalog](https://github.com/ryan-jan/MSCatalog) powershell module

It is tested with Windows 10 LTSC and Office 2016 32 bits, but you probably can change the search queries and tailor it to your needs

It creates an updates folder self contained with an install.bat batch script. You can copy that folder into your offline machine and run it as administrator from command line

As a caveat I have included other common updates as Avast, Acrobat Reader (Spanish version) and 7-zip.

Also the wssusscn2.cab is downloaded in case you need it
