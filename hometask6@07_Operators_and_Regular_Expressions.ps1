$string = $args[0]
$string = $string -replace '\s+', ' ' -replace '^\s', ''
Write-Host $string
