# PowerShell Essentials Advanced Functions and Scripts Homework
# 1. Write an advanced function to show the size of files in specific folder and sort all of them by size.


<# Code starts here #>
function Show-Files {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$Path
    )  
    process {
        Get-ChildItem -File -Filter *.* -Path $Path |
        Select-Object -Property Name,Length |
        Sort-Object -Property Length -Descending |
        Format-Table -AutoSize
    }
}
<# Code ends here #>


<# Executing the code
. .\hometask1@16_Advanced_Functions_and_Scripts.ps1

Show-Files -Path c:\users\admin\yany\
Name                                            Length
----                                            ------
hometask2@13_WMI_and_CIM.ps1                      2119
hometask1@13_WMI_and_CIM.ps1                      2033
hometask1@15_Function.ps1                         1830
hometask2@15_Function.ps1                          595
hometask1@16_Advanced_Functions_and_Scripts.ps1    559
computers.txt                                       42

Show-Files c:\users\admin\yany\      
Name                                            Length
----                                            ------
hometask2@13_WMI_and_CIM.ps1                      2119
hometask1@13_WMI_and_CIM.ps1                      2033
hometask1@15_Function.ps1                         1830
hometask2@15_Function.ps1                          595
hometask1@16_Advanced_Functions_and_Scripts.ps1    559
computers.txt                                       42
#>
