$string = $args[0]
$regexp = [regex]('(?:[0-9]{1,3}\.){3}[0-9]{1,3}')
$output = $regexp.Matches($string)
Write-Host $output
