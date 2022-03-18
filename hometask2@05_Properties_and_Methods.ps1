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