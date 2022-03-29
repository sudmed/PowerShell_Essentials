# PowerShell Essentials Advanced Functions and Scripts Homework
# 2. Write an advanced function to delete file from a specific folder if file size greater then specified size in Kb.


<# Code starts here #>
function Remove-Files {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)]
        [ValidateNotNullOrEmpty()]
        [string] $Path,

        [Parameter(Mandatory,Position=1)]
        [ValidateNotNullOrEmpty()]
        [int] $Size
    )

    begin {
        $SizeKB = $Size * 1KB

        Write-Verbose "Attention, the function deletes files without prompts!"
        Write-Verbose "Deleting files in folder '$Path' larger than $Size Kb"
        Write-Verbose "FILES TO BE DELETED:"

        Get-ChildItem -File -Filter *.* -Path $Path |
        Select-Object -Property Name,Length |
        Sort-Object -Property Length -Descending |
        Where-Object Length -gt $SizeKB | Out-String | Write-Verbose       

        $SelectedFiles = (Get-ChildItem -File -Filter *.* -Path $Path |
        Select-Object -Property Name,Length |
        Sort-Object -Property Length -Descending |
        Where-Object Length -gt $SizeKB).Name
    }

    process {
        foreach ($SelectedFile in $SelectedFiles) {
            remove-item $Path\$SelectedFile #-WhatIf
        }
    }
}
<# Code ends here #>


<# Executing the code
ls .\test | Sort Length
    Directory: C:\Users\admin\yany\test
Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a---          27.03.2022    12:09             42 computers.txt
-a---          29.03.2022    19:48            559 hometask1@16_Advanced_Functions_and_Scripts.ps1
-a---          28.03.2022    22:44            595 hometask2@15_Function.ps1
-a---          29.03.2022    20:22            913 hometask2@16_Advanced_Functions_and_Scripts.ps1
-a---          28.03.2022    21:45           1830 hometask1@15_Function.ps1
-a---          27.03.2022    13:46           2033 hometask1@13_WMI_and_CIM.ps1
-a---          27.03.2022    21:46           2119 hometask2@13_WMI_and_CIM.ps1
-a---          04.03.2022    20:42         604568 LAB1ACC1.zip
-a---          04.03.2022    20:42         622830 LAB1BUS1.zip
-a---          13.02.2022    11:24         802008 puttygen.exe
-a---          04.03.2022    20:42        1156632 LAB1SRV1.zip
-a---          13.02.2022    10:39        9358827 Oferta_readable.pdf

. .\hometask2@16_Advanced_Functions_and_Scripts.ps1
Remove-Files c:\users\admin\yany\test 620 -Verbose
VERBOSE: Attention, the function deletes files without prompts!
VERBOSE: Deleting files in folder 'c:\users\admin\yany\test' larger than 620 Kb
VERBOSE: FILES TO BE DELETED:
VERBOSE:
Name                 Length
----                 ------
Oferta_readable.pdf 9358827
LAB1SRV1.zip        1156632
puttygen.exe         802008

ls .\test | Sort Length
    Directory: C:\Users\admin\yany\test
Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a---          27.03.2022    12:09             42 computers.txt
-a---          29.03.2022    19:48            559 hometask1@16_Advanced_Functions_and_Scripts.ps1
-a---          28.03.2022    22:44            595 hometask2@15_Function.ps1
-a---          29.03.2022    20:22            913 hometask2@16_Advanced_Functions_and_Scripts.ps1
-a---          28.03.2022    21:45           1830 hometask1@15_Function.ps1
-a---          27.03.2022    13:46           2033 hometask1@13_WMI_and_CIM.ps1
-a---          27.03.2022    21:46           2119 hometask2@13_WMI_and_CIM.ps1
-a---          04.03.2022    20:42         604568 LAB1ACC1.zip
-a---          04.03.2022    20:42         622830 LAB1BUS1.zip
#>
