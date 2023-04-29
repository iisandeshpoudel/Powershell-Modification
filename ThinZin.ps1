#euta profile create garna, next oldprofile for safekeeping
#then to create default profile
#replace that profile with ThinZinprofile.ps1
<#

ok, let me simplfy for myself to understand
step 1. creating default and rewrite it with ThinZin profile
        ps. "$profile" reloads the profile hai so don't forget to do that
step 2. install required programs
        ps. force everything, and elavate the powershell

#>

#If the file does not exist, create it.
if (!(Test-Path -Path $PROFILE -PathType Leaf)) {
    try {
        # Detect Version of Powershell & Create Profile directories if they do not exist.
        if ($PSVersionTable.PSEdition -eq "Core" ) { 
            if (!(Test-Path -Path ($env:userprofile + "\Documents\Powershell"))) {
                New-Item -Path ($env:userprofile + "\Documents\Powershell") -ItemType "directory"
            }
        }
        elseif ($PSVersionTable.PSEdition -eq "Desktop") {
            if (!(Test-Path -Path ($env:userprofile + "\Documents\WindowsPowerShell"))) {
                New-Item -Path ($env:userprofile + "\Documents\WindowsPowerShell") -ItemType "directory"
            }
        }

        Invoke-RestMethod https://raw.githubusercontent.com/iisandeshpoudel/Powershell-Modification/main/ThinZinprofile.ps1 -o $PROFILE
        Write-Host "The profile @ [$PROFILE] has been created."
    }
    catch {
        throw $_.Exception.Message
    }
}
# If the file already exists, show the message and do nothing.
else {
    Get-Item -Path $PROFILE | Move-Item -Destination oldprofile.ps1
    Invoke-RestMethod https://raw.githubusercontent.com/iisandeshpoudel/Powershell-Modification/main/ThinZinprofile.ps1 -o $PROFILE
    Write-Host "The profile @ [$PROFILE] has been created and old profile removed."
}
& $profile

#installation process

<# 
Setting up priority as trusted .... kina ki next step ma aauni sabai prompt lai 'YES' dinxa
so no manunal input, run the script once and every prompt is dealt with. Fonts chai manually nai install garna parni vayo
can't make it automatic. Also terminal ma setting ma pani manually nai CardicD
#> 

Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted
Install-Script -Name winget-install -Force
winget-install.ps1

#installing Oh-my-posh
winget install JanDeDobbeleer.OhMyPosh -s winget

#installng terminal icon
Install-Module -Name Terminal-Icons -Repository PSGallery

#installing z module
Install-Module -Name z -Repository PSGallery

#installing ps readline
Install-Module -Name PSReadLine -RequiredVersion 2.2.5


#This downloads the CascadiaCode fonts but install it manually, the set the font in powershell
# setting > profile > powershell > Fonts : Set "CascadiaCode NF"
Invoke-RestMethod https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/CascadiaCode.zip?WT.mc_id=-blog-scottha -o cove.zip



