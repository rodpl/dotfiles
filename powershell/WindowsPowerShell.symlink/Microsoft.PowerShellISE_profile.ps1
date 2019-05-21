$myProfile = Join-Path (Split-Path $profile) Common_profile.ps1
if (Test-Path $myProfile) {
. $myProfile
}
Remove-Item variable:myProfile
