# Inicia MSSQL$SQLEXPRESS y SQLBrowser, crea regla de firewall para 1433
Try {
    Write-Output "Intentando iniciar MSSQL$SQLEXPRESS..."
    Start-Service -Name 'MSSQL$SQLEXPRESS' -ErrorAction Stop
    Write-Output "MSSQL$SQLEXPRESS iniciado"
} Catch {
    Write-Output "No se pudo iniciar MSSQL$SQLEXPRESS: $($_.Exception.Message)"
}

Try {
    Write-Output "Intentando iniciar SQLBrowser..."
    Start-Service -Name 'SQLBrowser' -ErrorAction Stop
    Write-Output "SQLBrowser iniciado"
} Catch {
    Write-Output "No se pudo iniciar SQLBrowser: $($_.Exception.Message)"
}

# Crear regla de firewall para TCP 1433 si no existe
try {
    $rule = Get-NetFirewallRule -DisplayName 'SQL Server TCP 1433' -ErrorAction SilentlyContinue
    if (-not $rule) {
        New-NetFirewallRule -DisplayName 'SQL Server TCP 1433' -Direction Inbound -Protocol TCP -LocalPort 1433 -Action Allow
        Write-Output "Regla de firewall 'SQL Server TCP 1433' creada"
    } else {
        Write-Output "Regla de firewall ya existe"
    }
} catch {
    Write-Output "No se pudo crear regla de firewall: $($_.Exception.Message)"
}

Write-Output "Estado de servicios:" 
Get-Service -Name 'MSSQL$SQLEXPRESS','SQLBrowser' | Format-Table -AutoSize

Write-Output "Puertos 1433 (netstat):"
netstat -ano | findstr 1433

Write-Output "Script finalizado. Si no se iniciaron los servicios, abre 'SQL Server Configuration Manager' y habilita TCP/IP para la instancia SQLEXPRESS y reinicia el servicio."
