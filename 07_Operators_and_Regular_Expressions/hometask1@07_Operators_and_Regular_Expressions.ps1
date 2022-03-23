# PowerShell Operators and Regular Expressions Homework
# 1. Write a script to find sequences of lowercase letters joined with underscore or dash.

<# Code starts here #>
$string = $args[0]
$regexp = [regex]('\w*[-_]\w*')
$output = $regexp.Matches($string)
Write-Host $output
<# Code ends here #>


<# Example 1
.\task1.ps1 "A Balrog is a powerful fictional monster in Middle-earth"
# Returns
Middle-earth
# Example 2
.\task1.ps1 "The symbol underscore, also called low_line or low dash."
# Returns
low_line
#>
