# PowerShell Conditional and Looping Statements Homework
# 1. Write a script to convert temperatures to and from Celsius, Fahrenheit.

<# Script contents start here #>
$inputNum = $args[0]

if ($inputNum -match '(^([0-9]{1,3})C$)') {
    $tempCelsius = $inputNum -replace 'C', ''
    [int]$tempFahrenheit = (9/5) * $tempCelsius + 32
    Write-Host $tempCelsius"C is" $tempFahrenheit "in Fahrenheit"
}
elseif ($inputNum -match '(^([0-9]{1,3})F$)') {
    $tempFahrenheit = $inputNum -replace 'F', ''
    [int]$tempCelsius = ($tempFahrenheit - 32) * (5/9)
    
    Write-Host $tempFahrenheit"F is" $tempCelsius "in Celsius"
}
else {
    Write-Host "Please enter a valid value in Celsius or Fahrenheit"
}
<# Script contents end here #>


<# Example 1
& .\script1.ps1 60C
# Returns 
60C is 140 in Fahrenheit

# Example 2
& .\script1.ps1 45F
# Returns 
45F is 7 in Celsius
#>
