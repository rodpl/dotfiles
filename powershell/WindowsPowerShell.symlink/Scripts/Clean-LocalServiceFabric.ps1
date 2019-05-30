<#

.SYNOPSIS

Remove and Unregister everything from Service Fabric

#>

Get-ServiceFabricApplication | Select-Object -ExpandProperty ApplicationName | ForEach-Object { Remove-ServiceFabricApplication -ApplicationName $_.AbsoluteUri -ForceRemove }
Get-ServiceFabricApplicationType | ForEach-Object { Unregister-ServiceFabricApplicationType -ApplicationTypeName $_.ApplicationTypeName -ApplicationTypeVersion $_.ApplicationTypeVersion }