# PowerShell Operators and Regular Expressions Homework
# 2. Write a script that matches a word at the end of string.


<# Code starts here #>
$string = $args[0]
$regexp = [regex]('\w*$')
$output = $regexp.Matches($string)
Write-Host $output
<# Code ends here #>


<# Example 1
.\task2.ps1 "Ents or talking trees are derived from the Old English word for giant"
# Returns
giant
#>
