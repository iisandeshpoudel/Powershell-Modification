# Setting up priority as trusted .... kina ki next step ma aauni sabai prompt lai 'YES' dinxa
# so no manunal input, run the script once and every prompt is dealt with

Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted
Install-Script -Name winget-install -Force
winget-install.ps1

# after installing winget, now i can use winget to install app 
# instead of microsoft store handler
# powershell cross platform so. it's easier to just change first five line code to make it cross platform

# to install notepads app
winget install JackieLiu.NotepadsApp

# or you can install this notepads with ms-store handler for futureproofing




# to remove notepad app and replace it with notepads ap - 2 steps ma dividing

# Step 1: Set Notepads as default Notepad app for .txt files
$defaultApp = "C:\Program Files\Notepads\Notepads.exe"
$ext = ".txt"
$progId = "Microsoft.Edge.Http"

$defaultAssoc = Get-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\$ext\UserChoice" -Name "Progid" -ErrorAction SilentlyContinue
if ($defaultAssoc -and $defaultAssoc.Progid -eq $progId) {
    # .txt files are already associated with Edge, do nothing
}
else {
    # Associate .txt files with Notepads
    $regPath = "HKCU:\SOFTWARE\Classes\$progId"
    if (!(Test-Path $regPath)) {
        New-Item $regPath
    }
    Set-ItemProperty $regPath "" "Notepads.Document"
    Set-ItemProperty $regPath "FriendlyTypeName" "@C:\Program Files\Notepads\Notepads.exe,-101"
    $regPath = "HKCU:\SOFTWARE\Classes\Notepads.Document\shell\open\command"
    Set-ItemProperty $regPath "" """$defaultApp"" ""%1"""
    $regPath = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\$ext\UserChoice"
    Set-ItemProperty $regPath "Progid" $progId
}

# Step 2: Uninstall original Notepad app
$originalApp = "C:\Windows\System32\notepad.exe"
if (Test-Path $originalApp) {
    Remove-Item $originalApp -Force
}
<<<<<<< HEAD
=======

>>>>>>> b608ce6f1df355648a75104283b0d1e82dd68a64
