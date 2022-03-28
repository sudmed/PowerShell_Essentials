# 1. Create a function that will get a string and one of several switch parameters and return the text from string with the color passed with switch parameter.
# Example 1 Write-ColoredMessage -Text "Hello there!" -Red
# Returns Hello there!
# Example 2 Write-ColoredMessage -Text "Hello there!" -Blue
# Returns Hello there!


<# Code starts here #>
function Write-ColoredMessage {
	param(
		[Parameter(Mandatory=$true, Position=0)]
		[string]$Text,
        	[Parameter(Mandatory=$false, Position=1)]
		[switch]$Black,
        	[switch]$DarkBlue,
        	[switch]$DarkGreen,
        	[switch]$DarkCyan,
        	[switch]$DarkRed,
        	[switch]$DarkMagenta,
        	[switch]$DarkYellow,
        	[switch]$Gray,
        	[switch]$DarkGray,
        	[switch]$Blue,
        	[switch]$Green,
        	[switch]$Cyan,
        	[switch]$Red,
        	[switch]$Magenta,
        	[switch]$Yellow,
        	[switch]$White
	)	
    if ($Black.IsPresent) { $color = "Black"}
    elseif ($DarkBlue.IsPresent) {$color = "DarkBlue"}
    elseif ($DarkGreen.IsPresent) {$color = "DarkGreen"}
    elseif ($DarkCyan.IsPresent){$color = "DarkCyan"}
    elseif ($DarkRed.IsPresent) {$color = "DarkRed"}
    elseif ($DarkMagenta.IsPresent) {$color = "DarkMagenta"}
    elseif ($DarkYellow.IsPresent) {$color = "DarkYellow"}
    elseif ($Gray.IsPresent) {$color = "Gray"}
    elseif ($DarkGray.IsPresent) {$color = "DarkGray"}
    elseif ($Blue.IsPresent) {$color = "Blue"}
    elseif ($Green.IsPresent) {$color = "Green"}
    elseif ($Cyan.IsPresent) {$color = "Cyan"}
    elseif ($Red.IsPresent) {$color = "Red"}
    elseif ($Magenta.IsPresent) {$color = "Magenta"}
    elseif ($Yellow.IsPresent) {$color = "Yellow"}
    else {$color = "White"}
	Write-Host $Text -foregroundcolor $color
}
<# Code ends here #>


<# Executing the code
. .\hometask1@15_Function.ps1
Write-ColoredMessage -Text "Hello there!" -Red
Hello there!
Write-ColoredMessage -Text "Hello there!" -Blue
Hello there!
#>
