# PowerShell Essentials Object Properties and Methods Homework
# 3. Write a PowerShell class to reverse a string word by word.

class ReverseLetters {
	[string]
    $string
	
    [string] Reverse([string]$string){
        return -join $string[-1..-$string.Length]
    }
}
