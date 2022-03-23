# PowerShell Essentials Object Properties and Methods Homework
# 1. Write a PowerShell class to implement pow(x, n) that is returns the base to the exponent power (base^exponent).

class BaseExponent {
    [double]Pow([double]$x, [double]$n)
    {
        return [Math]::Pow($x, $n)
    }
}
