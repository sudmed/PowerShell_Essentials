class BaseExponent {
    [double]Pow([double]$x, [double]$n)
    {
        return [Math]::Pow($x, $n)
    }
}
