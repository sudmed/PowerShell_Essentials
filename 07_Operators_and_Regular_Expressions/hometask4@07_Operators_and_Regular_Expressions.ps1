# PowerShell Operators and Regular Expressions Homework
# 4. Write a script to convert a date of mm-dd-yyyy format to dd-mm-yyyy format.


<# Code starts here #>
$string = $args[0]
[array]$date = $string.split("-")
$date = $date[1] + "-" + $date[0] + "-" + $date[2]
Write-Host $date
<# Code ends here #>


<# Example 1
.\task4.ps1 "09-17-1991"
# Returns
17-09-1991
#>
