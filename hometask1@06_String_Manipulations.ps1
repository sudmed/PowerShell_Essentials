$str1 = "xyaabbbccccdefww"
$str2 = "xxxxyyyyabklmopq"
[string]$str3 = ($str1[0..$str1.Length] + $str2[0..$str2.Length] | sort -Unique)
$str3.Replace(" ", $null)