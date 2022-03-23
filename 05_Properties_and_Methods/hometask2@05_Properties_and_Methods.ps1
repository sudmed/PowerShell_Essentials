# PowerShell Essentials Object Properties and Methods Homework
# 2. Write a PowerShell class which has two methods SetString() and PrintString(). SetString() accept a string from the user and PrintString() print the string in upper case.


class InOutString {
    [string]
    $string

    SetString([string]$string) 
    {
        $this.string = $String
    }
    
    [string]PrintString()
    {
        return $this.string.ToUpper()
    }
}
