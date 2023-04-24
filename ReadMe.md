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

#Remove the "#" of the below line and replace the default location for default of powershell startup.

#Set-Location D:\


```
