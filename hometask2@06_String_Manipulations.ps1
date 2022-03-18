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
