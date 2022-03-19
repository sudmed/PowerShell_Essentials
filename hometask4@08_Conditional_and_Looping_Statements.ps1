# PowerShell Conditional and Looping Statements Homework
# 4. Write a script to create the multiplication table (from 1 to 10) of a number.

<# Script contents start here #>
$inputNum = $args[0]
$i = 1

do {
    Write-Host $inputNum "x" $i "=" ($inputNum*$i)
    $i++
} until ($i -eq 11)
<# Script contents end here #>

<# Example 1
& .\script4.ps1 6
# Returns
6 x 1 = 6
6 x 2 = 12 
6 x 3 = 18 
6 x 4 = 24
6 x 5 = 30
6 x 6 = 36
6 x 7 = 42
6 x 8 = 48
6 x 9 = 54
6 x 10 = 60
#>
