# PowerShell Essentials Providers Homework
# 1. Write a script to get 10 longest words chart and put them in separate file.

  <# Code starts here #>
$text = Get-Content text.txt
$words = $text.split("'s") -split '[\s+,\.:;\?\!\t()-]' -split '[\[\]\{\}]' -split '\d' -replace "'" | Where-Object { $_.length -gt 0 }
$longestWords = (($words | sort { $_.length })[-1..-10]) > output.txt
  <# Code ends here #>


  <# Executing the script
& .\hometask1@11_Providers.ps1
Get-Content .\output.txt
  Executing the script #>

<# Output
transgression
interchanging
disparagement
coincidences
grasshoppers
misadventurd
combination
maidenheads
unworthiest
REPRESENTED
#>
