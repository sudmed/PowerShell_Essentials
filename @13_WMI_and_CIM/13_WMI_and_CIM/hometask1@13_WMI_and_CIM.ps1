# PowerShell Essentials WMI and CIM Homework
# 1. Write a script to get from selected remote computer the following data:
    #CPU model and max clock speed
    #Amount of RAM (total, free)
    #OS disk free space
    #OS version
    #Installed hot fixes
    #List of stopped services

<# Code starts here #>
$computers = Get-Content -Path ".\computers.txt"
foreach ($computer in $computers) {
    Write-Host $computer -ForegroundColor Green
    
    Write-Host "CPU model, max clock speed: " (Get-CimInstance -ClassName Win32_Processor -computername $computer |
        Select-Object -ExcludeProperty "CIM*").Name
    
    Write-Host "RAM total:                  " (Get-CimInstance -ClassName Win32_PhysicalMemory -computername $computer |
        Measure-Object -Property capacity -Sum |
            ForEach-Object {"{0:N1}" -f ([math]::round(($_.Sum / 1GB),2))}) Gb
    
    Write-Host "RAM free:                   " (Get-CimInstance -ClassName Win32_OperatingSystem -computername $computer |
        ForEach-Object {"{0:N1}" -f ([math]::round(($_.FreePhysicalMemory / 1MB),2))}) Gb
    
    Write-Host "OS disk free space:         " (Get-CimInstance -computername $computer -ClassName win32_logicaldisk |
        Where-Object caption -eq ((Get-CimInstance -computername $computer Win32_OperatingSystem).SystemDrive) |
            foreach-object {Write-Output "$('{0:N1}' -f ($_.FreeSpace/1gb)) GB"})
    
    Write-Host "OS version:                 " (Get-CimInstance -computername $computer -ClassName `
        Win32_OperatingSystem).Caption
    
    Write-Host "Installed hot fixes:        " (Get-CimInstance -computername $computer -ClassName `
        Win32_QuickFixEngineering -Property HotFixId).HotFixId
    
    Write-Host "List of stopped services:   " (Get-CimInstance -computername $computer -ClassName `
        Win32_Service -filter "state='stopped'").Name
    
    Write-Host "======================================================================"
    }
<# Code ends here #>
