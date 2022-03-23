# PowerShell Essentials String Manipulations Homework
# 2. Write a script that converts dash/underscore delimited words into camel and pascal casing.

<# Code starts here #>
if ($inputString -match "-")
<# checking for dashes in the inputString #>
{
$inputString = (Get-Culture).TextInfo.ToTitleCase($inputString)
$splitString = @(foreach ($word in ($inputString -replace "-", " ").split()) {$word})
$splitString = $splitString -replace $splitString[0], $splitString[0].ToLower()
[string]::Concat($splitString)
}
else {
<# if no dashes so underscores #>
$inputString -replace "_", $null
}
<# Code ends here #>


<# Example 1
$inputString = "the-stealth-warrior"
# Result
"theStealthWarrior"

# Example 2
$inputString = "The_Stealth_Warrior"
# Result
"TheStealthWarrior"
#>
