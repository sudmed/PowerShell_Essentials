# PowerShell Operators and Regular Expressions Homework
# 6. Write a script to remove multiple spaces in a string.


<# Code starts here #>
$string = $args[0]
$string = $string -replace '\s+', ' ' -replace '^\s', ''
Write-Host $string
<# Code ends here #>


<# Example 1
.\task6.ps1 " kube-system   coredns-869cb84759-drhbg                     1/1     Running   0          4h5m"
# Returns
kube-system coredns-869cb84759-drhbg 1/1 Running 0 4h5m
#>
