class ReverseLetters {
	[string]
    $string
	
    [string] Reverse([string]$string){
        return -join $string[-1..-$string.Length]
    }
}
