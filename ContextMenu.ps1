#Below is the .reg code for that same action
#Uncomment it then paste it in notepad, save it as .reg file and run it

<#Windows Registry Editor Version 5.00

[HKEY_CLASSES_ROOT\Directory\Background\shell\VSCode]
@="Code garum hai"
"Icon"="\"#path"""


[HKEY_CLASSES_ROOT\Directory\Background\shell\VSCode\command]
@="\"C:\\Users\\Sandesh Poudel\\AppData\\Local\\Programs\\Microsoft VS Code\\Code.exe\" \"%V\""

#>

$regContent = @"
Windows Registry Editor Version 5.00

[HKEY_CLASSES_ROOT\Directory\Background\shell\VSCode]
@="Code garum hai"

[HKEY_CLASSES_ROOT\Directory\Background\shell\VSCode\command]
@="\"C:\\Program Files\\Microsoft VS Code\\Code.exe\" \"%V\""
"@

Set-Content -Path "$env:TEMP\vscode.reg" -Value $regContent
Start-Process -FilePath "regedit.exe" -ArgumentList "/s $env:TEMP\vscode.reg"
Remove-Item "$env:TEMP\vscode.reg"
