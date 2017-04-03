#
# PluralsightHelpers.ps1
#

function Pluralsight-SortFolders() {
    param (
        [int]$startsFrom = 1,
        [string]$prefix = "m"
    )
    $private:counter = $startsFrom;
    Get-ChildItem | Sort LastWriteTime | %{ Rename-Item -Path $_.PSPath -NewName $("{1}{0:D2}" -f $counter, $prefix); $counter=++$counter }
}

function Pluralsight-SortFiles() {
    param (
        [int]$startsFrom = 1,
        [string]$prefix = "m"
    )
    $private:counter = $startsFrom;
    Get-ChildItem | Sort LastWriteTime | %{ Rename-Item -Path $_.PSPath -NewName $("{1}{0:D2}.mp4" -f $counter, $prefix); $counter=++$counter }
}