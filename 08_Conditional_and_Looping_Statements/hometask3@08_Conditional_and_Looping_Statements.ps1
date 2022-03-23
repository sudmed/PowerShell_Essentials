# PowerShell Conditional and Looping Statements Homework
# 3. Write a script to calculate a dog's age in human years: for the first two years, a dog year is equal to 10.5 human years. After that, each dog year equals 4 human years.

<# Script contents start here #>
$inputNum = $args[0]

if ($inputNum -le 0) {
    Write-Host "Age must be positive number."
}
elseif ($inputNum -le 2) {
        $dogAge = $inputNum * 10.5
        ($inputNum -eq 1) ? (Write-Host 10.5) : (Write-Host 10.5 $dogAge)
    } 
    
else {
    $dogAge = 21 + ($inputNum - 2) * 4
    $i = 1
    $dogAge_out = @('10.5','21')
    do {
        $dogAge_out += ((21+(4*$i)))
        $inputNum--
        $i++
    } until (($inputNum - 2) -eq 0) 
    Write-Host $dogAge_out
}
<# Script contents end here #>


<# Example 1
& .\script3.ps1 10
# Returns
10.5 21 25 29 33 37 41 45 49 53
#>
