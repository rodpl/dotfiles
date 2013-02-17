@echo off
echo. *** OPENING SQL SERVER PORTS IN THE FIREWALL ***
echo.
echo. *** Otwarcie portów dla SQL SERVER na firewall'u ***
echo.
echo. Źródło: “http://rperreaux.spaces.live.com/Blog/cns!5D7BD18D324CBEEF!729.entry?wa=wsignin1.0&sa=289774293”
echo.
echo. Korekta: Jakub Brodecki - http://blog.brodecki.pl/
echo.
echo. Opening SQL Server TCP 1433
netsh advfirewall firewall add rule name="SQL Server (TCP 1433)" dir=in action=allow protocol=TCP localport=1433 profile=domain
echo.
echo. Opening SQL Admin Connection TCP 1434
netsh advfirewall firewall add rule name="SQL Admin Connection (TCP 1434)" dir=in action=allow protocol=TCP localport=1434 profile=domain
echo.
echo. Opening SQL Service Broker TCP 4022
netsh advfirewall firewall add rule name="SQL Service Broker (TCP 4022)" dir=in action=allow protocol=TCP localport=4022 profile=domain
echo.
echo. Opening SQL Debugger/RPC TCP 135
netsh advfirewall firewall add rule name="SQL Debugger/RPC (TCP 135)" dir=in action=allow protocol=TCP localport=135 profile=domain
echo.
echo. Opening SQL Browser UDP 1434
netsh advfirewall firewall add rule name="SQL Browser (UDP 1434)" dir=in action=allow protocol=UDP localport=1434 profile=domain
echo.
echo. Opening Analysis Services TCP 2383
netsh advfirewall firewall add rule name="Analysis Services (TCP 2383)" dir=in action=allow protocol=TCP localport=2383 profile=domain
echo.
echo. Opening SQL Browser TCP 2382
netsh advfirewall firewall add rule name="SQL Browser (TCP 2382)" dir=in action=allow protocol=TCP localport=2382 profile=domain
echo.
echo. ***Done ***

