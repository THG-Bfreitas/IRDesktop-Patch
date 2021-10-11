  
### Universal Installer Created by Bfreitas 07/12/21 Contact for help####
#### Edit the Vars to utilize the script for any installer. ####
###Envoke Via CMD###
# powershell -command "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/THG-Bfreitas/IRDesktop-Patch/main/THG-ImageRightPatch.ps1'))" 


###### Vars#####
$Path="C:\temp"
$MSI = "IRConnect.msi"
$URL = "https://raw.githubusercontent.com/THG-Bfreitas/IRfiles/master/IRConnect.msi"
$OutputURL = "IRConnect.msi"
$Msilogfile = "IRConnect.txt"
$scriptlogfile ="scriptlogs.txt"



####Decentralized Logging due to remote installation
Start-Transcript -Path $path\$scriptlogfile
Write-Host "everything will end up in $path\$scriptlogfile"

Write-host "Checking for folder"
####Folder check#####
if (!(Test-Path $Path))
{
New-Item -itemType Directory -Path $Path -Name $FolderName
}
else
{
cls
write-host "Folder already exists"
}
Write-host "Downloading $url"
##Download File Via $URL
Invoke-WebRequest -Uri "$URL" -OutFile "$outputURL"

Write-host "Starting MSI installation"
##Executing MSI 
msiexec /p $OutputURL /qn

Stop-Transcript
