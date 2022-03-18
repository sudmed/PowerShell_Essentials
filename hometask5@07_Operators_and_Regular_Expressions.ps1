$string = $args[0]
$regexp = [regex]('\w{6,}')
$output = $regexp.Matches($string)
Write-Host $output
