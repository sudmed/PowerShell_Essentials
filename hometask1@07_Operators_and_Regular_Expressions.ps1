$string = $args[0]
$regexp = [regex]('\w*[-_]\w*')
$output = $regexp.Matches($string)
Write-Host $output
