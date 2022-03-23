# PowerShell Essentials Output and Format View Homework
# 2. Write a script to sort a list of elements using the bubble sort algorithm. Make output in console for each sort steps and could be controlled by Verbose parameter (user can choose if he would like to see output).


<# Code starts here #>
[CmdletBinding()]
param ($array)

$array = 99,-1,7,0,5,1,-8,11,-21,-4

Write-Verbose "$($array.Length) numbers are given: `
$array   `
`
Let's sort them by 'Bubble Sorting Algorithm' `
"

for ($j = 0; $j -le $array.Length-1 ; $j++) {
    Write-Verbose "< $("=="*($j))| STEP #$($j+1) |$("=="*($array.Length-$j-1))>"

for ($i = 0; $i -le $array.Length-2; $i++) {
    Write-Verbose "     Comparing '$($Array[$i])' and '$($Array[$i + 1])'"

    if ($array[$i] -gt $array[$i+1]) {
        #$temp = $array[$i]
        #$array[$i] = $array[$i+1]
        #$array[$i+1] = $temp
        $array[$i], $array[$i+1] = $array[$i+1], $array[$i]
        Write-Verbose "         Swapping values $($Array[$i]) <--> $($Array[$i + 1])"
    }
}
}
Write-Verbose " `
Sorted numbers are:  `
"
Write-Host $array
<# Code ends here #>


<# Executing the script
& .\hometask2@10_Output_and_Format_View.ps1
# Output

-21 -8 -4 -1 0 1 5 7 11 99


& .\hometask2@10_Output_and_Format_View.ps1 -Verbose
# Output

VERBOSE: 10 numbers are given:
99 -1 7 0 5 1 -8 11 -21 -4

Let's sort them by 'Bubble Sorting Algorithm'

VERBOSE: < | STEP #1 |==================>
VERBOSE:      Comparing '99' and '-1'
VERBOSE:          Swapping values -1 <--> 99
VERBOSE:      Comparing '99' and '7'
VERBOSE:          Swapping values 7 <--> 99
VERBOSE:      Comparing '99' and '0'
VERBOSE:          Swapping values 0 <--> 99
VERBOSE:      Comparing '99' and '5'
VERBOSE:          Swapping values 5 <--> 99
VERBOSE:      Comparing '99' and '1'
VERBOSE:          Swapping values 1 <--> 99
VERBOSE:      Comparing '99' and '-8'
VERBOSE:          Swapping values -8 <--> 99
VERBOSE:      Comparing '99' and '11'
VERBOSE:          Swapping values 11 <--> 99
VERBOSE:      Comparing '99' and '-21'
VERBOSE:          Swapping values -21 <--> 99
VERBOSE:      Comparing '99' and '-4'
VERBOSE:          Swapping values -4 <--> 99
VERBOSE: < ==| STEP #2 |================>
VERBOSE:      Comparing '-1' and '7'
VERBOSE:      Comparing '7' and '0'
VERBOSE:          Swapping values 0 <--> 7
VERBOSE:      Comparing '7' and '5'
VERBOSE:          Swapping values 5 <--> 7
VERBOSE:      Comparing '7' and '1'
VERBOSE:          Swapping values 1 <--> 7
VERBOSE:      Comparing '7' and '-8'
VERBOSE:          Swapping values -8 <--> 7
VERBOSE:      Comparing '7' and '11'
VERBOSE:      Comparing '11' and '-21'
VERBOSE:          Swapping values -21 <--> 11
VERBOSE:      Comparing '11' and '-4'
VERBOSE:          Swapping values -4 <--> 11
VERBOSE:      Comparing '11' and '99'
VERBOSE: < ====| STEP #3 |==============>
VERBOSE:      Comparing '-1' and '0'
VERBOSE:      Comparing '0' and '5'
VERBOSE:      Comparing '5' and '1'
VERBOSE:          Swapping values 1 <--> 5
VERBOSE:      Comparing '5' and '-8'
VERBOSE:          Swapping values -8 <--> 5
VERBOSE:      Comparing '5' and '7'
VERBOSE:      Comparing '7' and '-21'
VERBOSE:          Swapping values -21 <--> 7
VERBOSE:      Comparing '7' and '-4'
VERBOSE:          Swapping values -4 <--> 7
VERBOSE:      Comparing '7' and '11'
VERBOSE:      Comparing '11' and '99'
VERBOSE: < ======| STEP #4 |============>
VERBOSE:      Comparing '-1' and '0'
VERBOSE:      Comparing '0' and '1'
VERBOSE:      Comparing '1' and '-8'
VERBOSE:          Swapping values -8 <--> 1
VERBOSE:      Comparing '1' and '5'
VERBOSE:      Comparing '5' and '-21'
VERBOSE:          Swapping values -21 <--> 5
VERBOSE:      Comparing '5' and '-4'
VERBOSE:          Swapping values -4 <--> 5
VERBOSE:      Comparing '5' and '7'
VERBOSE:      Comparing '7' and '11'
VERBOSE:      Comparing '11' and '99'
VERBOSE: < ========| STEP #5 |==========>
VERBOSE:      Comparing '-1' and '0'
VERBOSE:      Comparing '0' and '-8'
VERBOSE:          Swapping values -8 <--> 0
VERBOSE:      Comparing '0' and '1'
VERBOSE:      Comparing '1' and '-21'
VERBOSE:          Swapping values -21 <--> 1
VERBOSE:      Comparing '1' and '-4'
VERBOSE:          Swapping values -4 <--> 1
VERBOSE:      Comparing '1' and '5'
VERBOSE:      Comparing '5' and '7'
VERBOSE:      Comparing '7' and '11'
VERBOSE:      Comparing '11' and '99'
VERBOSE: < ==========| STEP #6 |========>
VERBOSE:      Comparing '-1' and '-8'
VERBOSE:          Swapping values -8 <--> -1
VERBOSE:      Comparing '-1' and '0'
VERBOSE:      Comparing '0' and '-21'
VERBOSE:          Swapping values -21 <--> 0
VERBOSE:      Comparing '0' and '-4'
VERBOSE:          Swapping values -4 <--> 0
VERBOSE:      Comparing '0' and '1'
VERBOSE:      Comparing '1' and '5'
VERBOSE:      Comparing '5' and '7'
VERBOSE:      Comparing '7' and '11'
VERBOSE:      Comparing '11' and '99'
VERBOSE: < ============| STEP #7 |======>
VERBOSE:      Comparing '-8' and '-1'
VERBOSE:      Comparing '-1' and '-21'
VERBOSE:          Swapping values -21 <--> -1
VERBOSE:      Comparing '-1' and '-4'
VERBOSE:          Swapping values -4 <--> -1
VERBOSE:      Comparing '-1' and '0'
VERBOSE:      Comparing '0' and '1'
VERBOSE:      Comparing '1' and '5'
VERBOSE:      Comparing '5' and '7'
VERBOSE:      Comparing '7' and '11'
VERBOSE:      Comparing '11' and '99'
VERBOSE: < ==============| STEP #8 |====>
VERBOSE:      Comparing '-8' and '-21'
VERBOSE:          Swapping values -21 <--> -8
VERBOSE:      Comparing '-8' and '-4'
VERBOSE:      Comparing '-4' and '-1'
VERBOSE:      Comparing '-1' and '0'
VERBOSE:      Comparing '0' and '1'
VERBOSE:      Comparing '1' and '5'
VERBOSE:      Comparing '5' and '7'
VERBOSE:      Comparing '7' and '11'
VERBOSE:      Comparing '11' and '99'
VERBOSE: < ================| STEP #9 |==>
VERBOSE:      Comparing '-21' and '-8'
VERBOSE:      Comparing '-8' and '-4'
VERBOSE:      Comparing '-4' and '-1'
VERBOSE:      Comparing '-1' and '0'
VERBOSE:      Comparing '0' and '1'
VERBOSE:      Comparing '1' and '5'
VERBOSE:      Comparing '5' and '7'
VERBOSE:      Comparing '7' and '11'
VERBOSE:      Comparing '11' and '99'
VERBOSE: < ==================| STEP #10 |>
VERBOSE:      Comparing '-21' and '-8'
VERBOSE:      Comparing '-8' and '-4'
VERBOSE:      Comparing '-4' and '-1'
VERBOSE:      Comparing '-1' and '0'
VERBOSE:      Comparing '0' and '1'
VERBOSE:      Comparing '1' and '5'
VERBOSE:      Comparing '5' and '7'
VERBOSE:      Comparing '7' and '11'
VERBOSE:      Comparing '11' and '99'
VERBOSE:
Sorted numbers are:

-21 -8 -4 -1 0 1 5 7 11 99
#>
