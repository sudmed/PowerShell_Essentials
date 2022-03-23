# PowerShell Essentials Pipelines Homework
# 1. Write a script that it makes association with running services and process in Windows. Put result in hash table. Use pipelines as match as possible.


<# Code starts here #>
$servicesProcesses = @{}
Get-CimInstance -ClassName Win32_Service | Foreach-Object {
$_ | Add-Member -MemberType NoteProperty -Name Processes -Value (Get-Process -Id $_.ProcessId) -Passthru | Select-Object Name, Processes } | foreach-object {
    $services = @{}
    $object = $_
    $_ | Get-Member -MemberType noteproperty | Foreach-object { 
        $services.($_.name) = $object.($_.name)
    }
	$servicesProcesses += @{$services.name = $services.Values.ProcessName}
}
<# Code ends here #>
