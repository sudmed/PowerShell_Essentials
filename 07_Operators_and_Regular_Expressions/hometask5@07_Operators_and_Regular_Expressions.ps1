# PowerShell Operators and Regular Expressions Homework
# 5. Write a script to find all words which are at least 6 characters long in a string.


<# Code starts here #>
$string = $args[0]
$regexp = [regex]('\w{6,}')
$output = $regexp.Matches($string)
Write-Host $output
<# Code ends here #>


<# Example 1
.\task5.ps1 "Tue Sep 15 2020 15:39:48 GMT+0300 (Belarus Local Time)"
# Returns
Belarus
#>
