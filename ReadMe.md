#Installation process

Go to path

```Copy Path
C:\Users\<"UserName">\Documents\WindowsPowerShell
```


then replace the code inside of the
file named "Microsoft.PowerShell_profile.ps1" 
with this code: 

```
Import-Module oh-my-posh
Import-Module posh-git
Set-PoshPrompt -Theme amro
Import-Module -Name Terminal-Icons
Import-Module z
Import-Module PSReadLine

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows

<<<<<<< HEAD
#Remove the hash of the below line and replace the default location when powershell starts according to your desire.
=======
#Remove the "#" of the below line and replace the default location for default of powershell startup.
>>>>>>> 9cc2768564f220adc045187c280bd7183b328ecb

#Set-Location D:\


```
# To Remove the text shown in the startup of powershell session
![To Remove the text shown in the startup of powershell session](https://github.com/iisandeshpoudel/Powershell-Modification/blob/main/misc/remove%20watermark.png?raw=true)
