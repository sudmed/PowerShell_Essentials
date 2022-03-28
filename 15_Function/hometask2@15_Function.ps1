# 2. Create a function that will get any array from the pipeline. 
# Function output should be formatted according to the example below
# 1..3 | Get-ValueFromPipe
    # Returns
    # Value from pipe: 1
    # Value from pipe: 2
    # Value from pipe: 3
# @("First", "Second") | Get-ValueFromPipe
    # Returns
    # Value from pipe: First
    # Value from pipe: Second


<# Code starts here #>
function Get-ValueFromPipe {
	param(
		[Parameter(ValueFromPipeline = $true)]
	    [array]$digits
		)
    process {Write-Host "Value from pipe:" ($_)}        
}
<# Code ends here #>


<# Executing the code
. .\hometask2@15_Function.ps1   

1..3 | Get-ValueFromPipe
Value from pipe: 1      
Value from pipe: 2      
Value from pipe: 3      

@("First", "Second") | Get-ValueFromPipe
Value from pipe: First  
Value from pipe: Second
#>
