$string = $args[0]
[array]$date = $string.split("-")
$date = $date[1] + "-" + $date[0] + "-" + $date[2]
Write-Host $date
