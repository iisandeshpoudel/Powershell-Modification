Import-Module oh-my-posh
Import-Module posh-git
Set-PoshPrompt -Theme amro
Import-Module -Name Terminal-Icons
Import-Module z
Import-Module PSReadLine

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows

Set-Location D:\