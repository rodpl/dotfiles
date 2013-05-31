function RakeTabExpansion($lastBlock) {
    rake -T | % { if($_ -match "^rake ($lastword\S*)" ){ $matches[1] }}
}

$PowerTab_RegisterTabExpansion = Get-Command Register-TabExpansion -Module powertab -ErrorAction SilentlyContinue
if ($PowerTab_RegisterTabExpansion)
{
    & $PowerTab_RegisterTabExpansion "rake.bat" -Type Command {
        param($Context, [ref]$TabExpansionHasOutput, [ref]$QuoteSpaces)  # 1:

        $line = $Context.Line
        $lastBlock = [regex]::Split($line, '[|;]')[-1].TrimStart()
        $TabExpansionHasOutput.Value = $true
        RakeTabExpansion $lastBlock
    }
    return
}
if (Test-Path Function:\TabExpansion) {
    Rename-Item Function:\TabExpansion TabExpansionBackup
}

# Set up tab expansion and include hg expansion
function TabExpansion($line, $lastWord) {
   $lastBlock = [regex]::Split($line, '[|;]')[-1]

   switch -regex ($lastBlock) {
        "^$(Get-AliasPattern rake) (.*)" { RakeTabExpansion $lastBlock }

        # Fall back on existing tab expansion
        default { if (Test-Path Function:\TabExpansionBackup) { TabExpansionBackup $line $lastWord } }
   }
}
