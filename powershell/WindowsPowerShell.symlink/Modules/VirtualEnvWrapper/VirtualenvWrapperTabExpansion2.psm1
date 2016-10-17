<#
    Provides tab expansion functionalty for virtualenvwrapper on powershell v3.
    Adapted from: 
    PowerShell MVP Dr. Tobias Weltner
    www.powertheshell.com
    
#>
# Get out of here if there is TabExpansion2 does not exist
if (-not (Test-Path Function:TabExpansion2)) {
    return
}
#==============================================================================
# Ensure the old environment is restored when we exit. (Based on PowerTab.)
#------------------------------------------------------------------------------
$_oldTabExpansion = Get-Content Function:TabExpansion2

$module = $MyInvocation.MyCommand.ScriptBlock.Module 
$module.OnRemove = {
    Set-Content Function:\TabExpansion2 -Value $_oldTabExpansion
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

filter LetVirtualEnvsThru {
<# Weak test to filter out dirs not resembling a virtualenv.
#>
    $_ | where-object {
            $_.PSIsContainer -and `
            (test-path (join-path $_.fullname 'Scripts/activate.ps1'))
            }
}

$completion_VirtEnv = {
    param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameter)

    get-childitem $env:WORKON_HOME | `
    LetVirtualEnvsThru | `
    where-object { 
        $_.name -like "$wordToComplete*"
    } | `
    ForEach-Object {
        New-Object System.Management.Automation.CompletionResult $_.Name, $_.Name, 'ParameterValue', ('{0} ({1})' -f $_.DisplayName, $_.Status)
    }
}

if (-not $global:options) { $global:options = @{CustomArgumentCompleters = @{};NativeArgumentCompleters = @{}}}
$global:options['CustomArgumentCompleters']['Set-VirtualEnvironment:Name'] = $Completion_VirtEnv
$global:options['CustomArgumentCompleters']['Remove-VirtualEnvironment:Name'] = $Completion_VirtEnv
$global:options['CustomArgumentCompleters']['workon:Name'] = $Completion_VirtEnv

$Function:TabExpansion2 = $Function:TabExpansion2 -replace 'End\r\n{','End { if ($null -ne $options) { $options += $global:options} else {$options = $global:options}'
