$myProfile = Join-Path (Split-Path $profile) Common_profile.ps1
if (Test-Path $myProfile) {
. $myProfile
}
Remove-Item variable:myProfile

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}