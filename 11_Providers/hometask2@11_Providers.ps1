# PowerShell Essentials Providers Homework
# 2. Write a script to sort words in alphabet order from specific file and put them into 26 text files named A.txt, B.txt, and so on up to Z.txt.


<# Code starts here #>
$text = Get-Content text.txt
$destPath = ".\out\"
$words = $text.split("'s") -split '[\s+,\.:;\?\!\t()-]' -split '[\[\]\{\}]' -split '\d' -replace "'" -replace "&" | Where-Object { $_.length -gt 0 }
$sortedWords = ($words | Sort-Object)

$sortedWords | Group-Object {$_.Substring(0,1).ToUpper()} | ForEach-Object {
  #$path = Join-Path $destPath $_.Name
  $path = Join-Path $destPath $_.Name
  $_.Group | Set-Content $path".txt"
}
<# Code ends here #>


<# Executing the script
& .\hometask2@11_Providers.ps1
ls .\out | sort
# Output

    Directory: C:\Users\admin\yesy\out

Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a---          24.03.2022     0:29           3229 A.txt
-a---          24.03.2022     0:29           2420 B.txt
-a---          24.03.2022     0:29           2158 C.txt
-a---          24.03.2022     0:29           1260 D.txt
-a---          24.03.2022     0:29            888 E.txt
-a---          24.03.2022     0:29           1807 F.txt
-a---          24.03.2022     0:29           1131 G.txt
-a---          24.03.2022     0:29           2300 H.txt
-a---          24.03.2022     0:29           1656 I.txt
-a---          24.03.2022     0:29            339 J.txt
-a---          24.03.2022     0:29            234 K.txt
-a---          24.03.2022     0:29           1733 L.txt
-a---          24.03.2022     0:29           2870 M.txt
-a---          24.03.2022     0:29           1343 N.txt
-a---          24.03.2022     0:29           1436 O.txt
-a---          24.03.2022     0:29           1520 P.txt
-a---          24.03.2022     0:29            172 Q.txt
-a---          24.03.2022     0:29           1071 R.txt
-a---          24.03.2022     0:29           3977 S.txt
-a---          24.03.2022     0:29           5288 T.txt
-a---          24.03.2022     0:29            337 U.txt
-a---          24.03.2022     0:29            364 V.txt
-a---          24.03.2022     0:29           2812 W.txt
-a---          24.03.2022     0:29              7 X.txt
-a---          24.03.2022     0:29            892 Y.txt
-a---          24.03.2022     0:29              6 Z.txt
#>
