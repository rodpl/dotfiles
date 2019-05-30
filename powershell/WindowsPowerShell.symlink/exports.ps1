# General variables
$computer = if ($IsMacOS) { uname -n } else { get-content env:computername }
$profileRoot = "$(split-path $profile)"
$scripts = "$profileRoot\Scripts"
$modules = "$profileRoot\Modules"

# Configurations based on computername
switch ($computer) {
    { "PC06244", "PC06639" -contains $_ } {
        $env:http_proxy = "http://proxy:8080";
        $env:https_proxy = "http://proxy:8080";
        break;
    }
}

# Configuring git
$gitInstallDir = Get-FolderInProgramFiles "Git"
if ($gitInstallDir -ne $null) {
    $env:Path = "$env:Path;$gitInstallDir\bin;$gitInstallDir\mingw\bin"
    if (!$Env:HOME) { $env:HOME = "$env:HOMEDRIVE$env:HOMEPATH" }
    if (!$Env:HOME) { $env:HOME = $env:USERPROFILE }
    if (!$Env:GIT_HOME) { $env:GIT_HOME = "$gitInstallDir" }
    $env:PLINK_PROTOCOL = 'ssh'
    Remove-Item Env:\GIT_SSH
}
