$string = $args[0]
$regexp = [regex]('\w*$')
$output = $regexp.Matches($string)
Write-Host $output
