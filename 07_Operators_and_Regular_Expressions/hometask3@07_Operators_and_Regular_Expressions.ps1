# PowerShell Operators and Regular Expressions Homework
# 3. Write a script that matches an IP address.


<# Code starts here #>
$string = $args[0]
$regexp = [regex]('(?:[0-9]{1,3}\.){3}[0-9]{1,3}')
$output = $regexp.Matches($string)
Write-Host $output
<# Code ends here #>


<# Example 1
.\task3.ps1 "Reply from 10.8.216.77: bytes=32 time<1ms TTL=128"
# Returns
10.8.216.77
#>
