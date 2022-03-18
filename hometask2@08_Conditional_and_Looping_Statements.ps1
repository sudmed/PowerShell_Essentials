# PowerShell Conditional and Looping Statements Homework
# 2. Write a script to get the Fibonacci series between 0 to N.

<# Script contents start here #>
$inputNum = $args[0]

function get-Fibonacci ($inputNum) {
    $current = 0;
    $previous = 1;
    while ($current -lt $inputNum) {
            $current;
            $current,$previous = ($current + $previous),$current
        }
    }

if ($inputNum -match '^([0-9]{1,})$') {
    $seriesFibonacci = get-Fibonacci ($inputNum)
    [string]$seriesFibonacci = $seriesFibonacci -replace $seriesFibonacci[0], ''
    $seriesFibonacci
}

else {
    Write-Host "Please enter a valid value: integer omly"
}
<# Script contents end here #>


<# Example 1
& .\script2.ps1 50
# Returns
1 1 2 3 5 8 13 21 34
#>
