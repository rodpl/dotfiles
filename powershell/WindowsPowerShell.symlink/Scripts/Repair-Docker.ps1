<#

.SYNOPSIS

Fixing Docker on my machine.

1. Delete all interfaces which contains passed ip numbers as nameservers.

#>

param (
    # Invalid servernames
    [Parameter(Position = 0)]
    [string[]]
    $Hosts = @("8.8.8.8", "194.204.159.1"),

    [switch]
    $ForceRestart
)

$tcpServicesPath = "Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters";
$regex = $Hosts -join '|'
$interfaces = Get-ChildItem "$tcpServicesPath\Interfaces" -Recurse -ErrorAction Stop | `
    Get-ItemProperty -Name DhcpNameServer -ErrorAction SilentlyContinue | `
    Where-Object { $_.DhcpNameServer -match $regex } | `
    ForEach-Object { if ($_.PSPath -match '{\w{8}-\w{4}-\w{4}-\w{4}-\w{12}}') { $matches[0] } }

foreach ($item in $interfaces) {
    Remove-Item "$tcpServicesPath\Interfaces\$item" -ErrorAction Stop
    Remove-Item "$tcpServicesPath\Adapters\$item" -ErrorAction SilentlyContinue
    Remove-Item "$tcpServicesPath\DNSRegisteredAdapters\$item" -ErrorAction SilentlyContinue
    Write-Warning "Interface $item removed"
}

if (($interfaces.count -gt -0) -or ($ForceRestart -eq $true)) {
    Stop-Service com.docker.service
    Stop-Service docker
    Stop-Process -Name "dockerd" -Force -ErrorAction SilentlyContinue
    Stop-Process -Name "Docker Desktop" -Force -ErrorAction Stop
    Start-Service docker
    Start-Service com.docker.service
    Start-Process -FilePath "c:\program files\docker\docker\Docker Desktop.exe"
}