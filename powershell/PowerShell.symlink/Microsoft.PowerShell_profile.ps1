Push-Location (Split-Path -parent $profile)
"components", "functions", "aliases", "exports", "extra" | Where-Object { Test-Path "$_.ps1" } | ForEach-Object -process { Invoke-Expression ". .\$_.ps1" }
Pop-Location

<############### Start of PowerTab Initialization Code ########################
    Added to profile by PowerTab setup for loading of custom tab expansion.
    Import other modules after this, they may contain PowerTab integration.
#>

Import-Module "PowerTab" -ArgumentList "C:\Users\z6ddw\Documents\PowerShell\PowerTabConfig.xml"
################ End of PowerTab Initialization Code ##########################

# Git
Import-Module "posh-git"
Set-Alias -Name "git" -Value "git.exe" # This is needed for posh

#cd C:\Projects
