# Manage Data Structured File Formats with PowerShell Homework
# 1. Write a script to get list of process (ex. All chrome process) and put Name, Id, StartTime, PagedMemorySize in 
# CSV/XML/JSON/YAML files where possible.


<# Code starts here #>
$processes = Get-Process -Name "chrome"
$processesSeparated = $processes | Select-Object Name, Id, StartTime, PagedMemorySize

# exporting in YAML
$HashTableData = foreach ($process in $processes) { 
    @{ $processes.IndexOf($process) = @{
        Name = "$($process.Name)"
        Id = $process.Id
        StartTime = "$($process.StartTime)" 
        PagedMemorySize = "$($process.PagedMemorySize)"
        } 
    } 
 }
ConvertTo-Yaml -Data $HashTableData -OutFile $( $( Resolve-Path ./ ).Path + "\chrome-processes.yaml" ) -Force

# exporting in CSV
$processesSeparated | Export-Csv -Path ".\chrome-processes.csv" -Delimiter ";" -Encoding Unicode -NoTypeInformation

# exporting in XML
$xml = [xml]$($processesSeparated | ConvertTo-Xml -Depth 2)
$xml.Save( $( Resolve-Path ./ ).Path + "\chrome-processes.xml" )

# exporting in JSON
$processesSeparated | ConvertTo-Json | Set-Content -Path .\chrome-processes.json
<# Code ends here #>


<# Executing the script
& .\hometask1@12_Manage_Data_Structured_File_Formats.ps1
ls .\chrome-processes*

    Directory: C:\Users\admin

Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a---          24.03.2022    21:53           6908 chrome-processes.csv 
-a---          24.03.2022    21:53           9376 chrome-processes.json
-a---          24.03.2022    21:53          24713 chrome-processes.xml 
-a---          24.03.2022    21:53           7289 chrome-processes.yaml
#>
