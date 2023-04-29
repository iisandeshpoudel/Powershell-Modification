#Uncomment it for gitbash
#Import-Module posh-git
Import-Module oh-my-posh
Set-PoshPrompt -Theme amro
Import-Module -Name Terminal-Icons
Import-Module z
Import-Module PSReadLine

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows
