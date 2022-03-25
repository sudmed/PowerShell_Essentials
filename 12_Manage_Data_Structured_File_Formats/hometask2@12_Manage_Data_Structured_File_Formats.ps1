# Manage Data Structured File Formats with PowerShell Homework
# 2. Write a script to create hash-tables based on data that stored in files from task 1.

<# Code starts here #>
<# JSON convertation v1 #>
$JSON_hashtable1 = Get-Content -Path ".\chrome-processes.json" | ConvertFrom-Json -AsHashtable
Write-Host `n
Write-Host -foregroundcolor red -backgroundcolor yellow "`nJSON-file convertation to Hashtable, the first variant"
$JSON_hashtable1
Write-Host -foregroundcolor red -backgroundcolor yellow `n($JSON_hashtable1 | Get-Member | findstr 'TypeName')
Write-Host `n

<# JSON convertation v2 #>
$JSONdata = Get-Content -Path ".\chrome-processes.json" | ConvertFrom-Json
$JSON_hashtable2 = @{}
foreach ($property in $JSONdata.PSObject.Properties) {
    $JSON_hashtable2[$property.Name] = $property.Value
}
Write-Host `n
Write-Host -foregroundcolor red -backgroundcolor yellow "`nJSON-file convertation to Hashtable, the second variant"
Write-Host `n
$JSON_hashtable2
Write-Host -foregroundcolor red -backgroundcolor yellow `n($JSON_hashtable2 | Get-Member | findstr 'TypeName')
Write-Host `n

<# JSON convertation v3 #>
$JSONdata = Get-Content -Path ".\chrome-processes.json" | ConvertFrom-Json
$JSON_hashtable3 = @{}
$JSON_hashtable3 = foreach ($i in $JSONdata) {
@{ $JSONdata.IndexOf($i) = @{
Name = "$($i.Name)"
Id = $i.Id
StartTime = "$($i.StartTime)" 
PagedMemorySize = "$($i.PagedMemorySize)"
        } 
    } 
}
Write-Host -foregroundcolor red -backgroundcolor yellow "`nJSON-file convertation to Hashtable, the third variant"
Write-Host `n
$JSON_hashtable3
Write-Host -foregroundcolor red -backgroundcolor yellow `n($JSON_hashtable3 | Get-Member | findstr 'TypeName')
Write-Host `n

<# CSV convertation #>
$CSVdata = Import-CSV ".\chrome-processes.csv" -delimiter ";"
$CSV_hashtable = @{}
$CSV_hashtable = foreach ($i in $CSVdata) {
@{ $CSVdata.IndexOf($i) = @{
Name = "$($i.Name)"
Id = $i.Id
StartTime = "$($i.StartTime)" 
PagedMemorySize = "$($i.PagedMemorySize)"
        } 
    } 
}
Write-Host -foregroundcolor red -backgroundcolor yellow "`nCSV-file convertation to Hashtable"
Write-Host `n
$CSV_hashtable
Write-Host -foregroundcolor red -backgroundcolor yellow `n($CSV_hashtable | Get-Member | findstr 'TypeName')
Write-Host `n

<# XML convertation #>
$XMLdata = [xml]$(Get-Content -Path ".\chrome-processes.xml")
$XML_hashtable = @{}
$XML_hashtable = foreach ($i in $XMLdata.DocumentElement.ChildNodes) {
@{ $($XMLdata.DocumentElement.ChildNodes).IndexOf($i) = @{
Name = $($i.Property."#text"[0])
Id = $($i.Property."#text"[1])
StartTime = $($i.Property."#text"[2])
PagedMemorySize = $($i.Property."#text"[3])
        } 
    } 
}
Write-Host -foregroundcolor red -backgroundcolor yellow "`nXML-file convertation to Hashtable"
Write-Host `n
$XML_hashtable
Write-Host -foregroundcolor red -backgroundcolor yellow `n($XML_hashtable | Get-Member | findstr 'TypeName')
Write-Host `n


<# YAML convertation #>
$YAMLdata = ConvertFrom-Yaml -Yaml $( $(Get-Content -Path ".\chrome-processes.yaml") -join "`n" )
$YAML_hashtable = @{}
$YAML_hashtable = foreach ($i in $YAMLdata) {
@{ $YAMLdata.IndexOf($i) = @{
Name = "$($i.Name)"
Id = $i.Id
StartTime = "$($i.StartTime)" 
PagedMemorySize = "$($i.PagedMemorySize)"
        } 
    } 
}
Write-Host -foregroundcolor red -backgroundcolor yellow "`nYAML-file convertation to Hashtable"
Write-Host `n
$YAML_hashtable
Write-Host -foregroundcolor red -backgroundcolor yellow `n($YAML_hashtable | Get-Member | findstr 'TypeName')
Write-Host `n
<# Code ends here #>



<# Executing the script
& .\hometask2@12_Manage_Data_Structured_File_Formats.ps1


JSON-file convertation to Hashtable, the first variant

Name                           Value
----                           -----
PagedMemorySize                90660864
Name                           chrome
Id                             1280
StartTime                      20.03.2022 13:54:58
PagedMemorySize                295514112
Name                           chrome
Id                             1612
StartTime                      20.03.2022 11:52:29
PagedMemorySize                93569024
Name                           chrome
Id                             1756
StartTime                      20.03.2022 11:52:03
PagedMemorySize                333897728
Name                           chrome
Id                             1956
StartTime                      20.03.2022 11:52:29
PagedMemorySize                9003008
Name                           chrome
Id                             2064
StartTime                      20.03.2022 11:52:21
PagedMemorySize                48537600
Name                           chrome
Id                             2540
StartTime                      20.03.2022 11:52:00
PagedMemorySize                13991936
Name                           chrome
Id                             2580
StartTime                      24.03.2022 21:32:31
PagedMemorySize                16232448
Name                           chrome
Id                             2728
StartTime                      20.03.2022 11:52:00
PagedMemorySize                603799552
Name                           chrome
Id                             3952
StartTime                      20.03.2022 11:52:00
PagedMemorySize                74448896
Name                           chrome
Id                             4072
StartTime                      20.03.2022 17:38:32
PagedMemorySize                45797376
Name                           chrome
Id                             5176
StartTime                      24.03.2022 16:54:26
PagedMemorySize                53579776
Name                           chrome
Id                             5692
StartTime                      24.03.2022 17:31:54
PagedMemorySize                51359744
Name                           chrome
Id                             6436
StartTime                      20.03.2022 11:52:54
PagedMemorySize                472199168
Name                           chrome
Id                             6756
StartTime                      20.03.2022 11:52:32
PagedMemorySize                53575680
Name                           chrome
Id                             6968
StartTime                      20.03.2022 11:52:58
PagedMemorySize                15708160
Name                           chrome
Id                             8624
StartTime                      20.03.2022 11:51:59
PagedMemorySize                10014720
Name                           chrome
Id                             9196
StartTime                      24.03.2022 20:16:32
PagedMemorySize                236417024
Name                           chrome
Id                             9640
StartTime                      20.03.2022 11:52:42
PagedMemorySize                70230016
Name                           chrome
Id                             9796
StartTime                      24.03.2022 17:32:01
PagedMemorySize                57835520
Name                           chrome
Id                             10400
StartTime                      20.03.2022 11:52:57
PagedMemorySize                140472320
Name                           chrome
Id                             11248
StartTime                      23.03.2022 17:54:25
PagedMemorySize                92151808
Name                           chrome
Id                             11572
StartTime                      20.03.2022 11:52:44
PagedMemorySize                147558400
Name                           chrome
Id                             12852
StartTime                      23.03.2022 17:54:20
PagedMemorySize                1450573824
Name                           chrome
Id                             12916
StartTime                      20.03.2022 11:51:59
PagedMemorySize                95342592
Name                           chrome
Id                             13596
StartTime                      20.03.2022 11:52:29
PagedMemorySize                29503488
Name                           chrome
Id                             13676
StartTime                      20.03.2022 11:52:00
PagedMemorySize                27107328
Name                           chrome
Id                             13764
StartTime                      24.03.2022 0:41:42
PagedMemorySize                29519872
Name                           chrome
Id                             13820
StartTime                      20.03.2022 11:52:00
PagedMemorySize                68530176
Name                           chrome
Id                             14408
StartTime                      20.03.2022 11:52:57
PagedMemorySize                32714752
Name                           chrome
Id                             14504
StartTime                      20.03.2022 11:52:00
PagedMemorySize                70553600
Name                           chrome
Id                             14560
StartTime                      20.03.2022 11:52:53
PagedMemorySize                446128128
Name                           chrome
Id                             14564
StartTime                      20.03.2022 11:51:56
PagedMemorySize                27852800
Name                           chrome
Id                             14856
StartTime                      20.03.2022 11:52:00
PagedMemorySize                52555776
Name                           chrome
Id                             14904
StartTime                      20.03.2022 11:51:59
PagedMemorySize                8114176
Name                           chrome
Id                             15248
StartTime                      20.03.2022 11:51:56
PagedMemorySize                18223104
Name                           chrome
Id                             15368
StartTime                      20.03.2022 11:52:00
PagedMemorySize                96866304
Name                           chrome
Id                             15460
StartTime                      24.03.2022 0:22:32
PagedMemorySize                23089152
Name                           chrome
Id                             15516
StartTime                      20.03.2022 11:52:00
PagedMemorySize                20938752
Name                           chrome
Id                             15588
StartTime                      20.03.2022 11:52:00
PagedMemorySize                40656896
Name                           chrome
Id                             15660
StartTime                      20.03.2022 11:52:00
PagedMemorySize                16715776
Name                           chrome
Id                             15732
StartTime                      20.03.2022 11:52:00
PagedMemorySize                16535552
Name                           chrome
Id                             15804
StartTime                      20.03.2022 11:52:00
PagedMemorySize                151642112
Name                           chrome
Id                             15864
StartTime                      23.03.2022 19:25:01
PagedMemorySize                50077696
Name                           chrome
Id                             15908
StartTime                      20.03.2022 11:52:00
PagedMemorySize                27299840
Name                           chrome
Id                             16052
StartTime                      20.03.2022 11:52:00
PagedMemorySize                22716416
Name                           chrome
Id                             16128
StartTime                      20.03.2022 11:52:00
PagedMemorySize                15958016
Name                           chrome
Id                             16136
StartTime                      20.03.2022 11:52:00
PagedMemorySize                283332608
Name                           chrome
Id                             16632
StartTime                      21.03.2022 18:43:15
PagedMemorySize                69644288
Name                           chrome
Id                             16896
StartTime                      20.03.2022 11:52:41
PagedMemorySize                58032128
Name                           chrome
Id                             16952
StartTime                      23.03.2022 17:54:02
PagedMemorySize                37330944
Name                           chrome
Id                             17164
StartTime                      20.03.2022 11:52:52
PagedMemorySize                341143552
Name                           chrome
Id                             17716
StartTime                      20.03.2022 11:52:19
PagedMemorySize                86622208
Name                           chrome
Id                             17900
StartTime                      24.03.2022 15:55:01
PagedMemorySize                32305152
Name                           chrome
Id                             18688
StartTime                      20.03.2022 21:40:04
PagedMemorySize                22077440
Name                           chrome
Id                             18904
StartTime                      21.03.2022 18:09:01
PagedMemorySize                89894912
Name                           chrome
Id                             19400
StartTime                      21.03.2022 18:55:15
PagedMemorySize                27836416
Name                           chrome
Id                             19660
StartTime                      24.03.2022 0:45:36
PagedMemorySize                66924544
Name                           chrome
Id                             19764
StartTime                      24.03.2022 15:28:58
PagedMemorySize                62050304
Name                           chrome
Id                             19924
StartTime                      24.03.2022 17:29:10
PagedMemorySize                174501888
Name                           chrome
Id                             20136
StartTime                      22.03.2022 20:05:45
PagedMemorySize                66433024
Name                           chrome
Id                             20324
StartTime                      20.03.2022 21:40:17
PagedMemorySize                292151296
Name                           chrome
Id                             20520
StartTime                      21.03.2022 19:55:26
PagedMemorySize                34840576
Name                           chrome
Id                             20936
StartTime                      21.03.2022 17:24:05
PagedMemorySize                106733568
Name                           chrome
Id                             21512
StartTime                      20.03.2022 21:40:19
PagedMemorySize                70979584
Name                           chrome
Id                             21844
StartTime                      22.03.2022 20:05:05
PagedMemorySize                77025280
Name                           chrome
Id                             22596
StartTime                      23.03.2022 17:54:14
PagedMemorySize                125124608
Name                           chrome
Id                             23344
StartTime                      24.03.2022 20:46:08

    TypeName: System.Collections.Hashtable





JSON-file convertation to Hashtable, the second variant


LongLength                     67
IsReadOnly                     False
Length                         67
Count                          67
IsSynchronized                 False
Rank                           1
IsFixedSize                    True
SyncRoot                       {@{Name=chrome; Id=1280; StartTime=20.03.2022 13:54:58; PagedMemorySize=…

    TypeName: System.Collections.Hashtable



JSON-file convertation to Hashtable, the third variant


0                              {StartTime, Id, PagedMemorySize, Name}
1                              {StartTime, Id, PagedMemorySize, Name}
2                              {StartTime, Id, PagedMemorySize, Name}
3                              {StartTime, Id, PagedMemorySize, Name}
4                              {StartTime, Id, PagedMemorySize, Name}
5                              {StartTime, Id, PagedMemorySize, Name}
6                              {StartTime, Id, PagedMemorySize, Name}
7                              {StartTime, Id, PagedMemorySize, Name}
8                              {StartTime, Id, PagedMemorySize, Name}
9                              {StartTime, Id, PagedMemorySize, Name}
10                             {StartTime, Id, PagedMemorySize, Name}
11                             {StartTime, Id, PagedMemorySize, Name}
12                             {StartTime, Id, PagedMemorySize, Name}
13                             {StartTime, Id, PagedMemorySize, Name}
14                             {StartTime, Id, PagedMemorySize, Name}
15                             {StartTime, Id, PagedMemorySize, Name}
16                             {StartTime, Id, PagedMemorySize, Name}
17                             {StartTime, Id, PagedMemorySize, Name}
18                             {StartTime, Id, PagedMemorySize, Name}
19                             {StartTime, Id, PagedMemorySize, Name}
20                             {StartTime, Id, PagedMemorySize, Name}
21                             {StartTime, Id, PagedMemorySize, Name}
22                             {StartTime, Id, PagedMemorySize, Name}
23                             {StartTime, Id, PagedMemorySize, Name}
24                             {StartTime, Id, PagedMemorySize, Name}
25                             {StartTime, Id, PagedMemorySize, Name}
26                             {StartTime, Id, PagedMemorySize, Name}
27                             {StartTime, Id, PagedMemorySize, Name}
28                             {StartTime, Id, PagedMemorySize, Name}
29                             {StartTime, Id, PagedMemorySize, Name}
30                             {StartTime, Id, PagedMemorySize, Name}
31                             {StartTime, Id, PagedMemorySize, Name}
32                             {StartTime, Id, PagedMemorySize, Name}
33                             {StartTime, Id, PagedMemorySize, Name}
34                             {StartTime, Id, PagedMemorySize, Name}
35                             {StartTime, Id, PagedMemorySize, Name}
36                             {StartTime, Id, PagedMemorySize, Name}
37                             {StartTime, Id, PagedMemorySize, Name}
38                             {StartTime, Id, PagedMemorySize, Name}
39                             {StartTime, Id, PagedMemorySize, Name}
40                             {StartTime, Id, PagedMemorySize, Name}
41                             {StartTime, Id, PagedMemorySize, Name}
42                             {StartTime, Id, PagedMemorySize, Name}
43                             {StartTime, Id, PagedMemorySize, Name}
44                             {StartTime, Id, PagedMemorySize, Name}
45                             {StartTime, Id, PagedMemorySize, Name}
46                             {StartTime, Id, PagedMemorySize, Name}
47                             {StartTime, Id, PagedMemorySize, Name}
48                             {StartTime, Id, PagedMemorySize, Name}
49                             {StartTime, Id, PagedMemorySize, Name}
50                             {StartTime, Id, PagedMemorySize, Name}
51                             {StartTime, Id, PagedMemorySize, Name}
52                             {StartTime, Id, PagedMemorySize, Name}
53                             {StartTime, Id, PagedMemorySize, Name}
54                             {StartTime, Id, PagedMemorySize, Name}
55                             {StartTime, Id, PagedMemorySize, Name}
56                             {StartTime, Id, PagedMemorySize, Name}
57                             {StartTime, Id, PagedMemorySize, Name}
58                             {StartTime, Id, PagedMemorySize, Name}
59                             {StartTime, Id, PagedMemorySize, Name}
60                             {StartTime, Id, PagedMemorySize, Name}
61                             {StartTime, Id, PagedMemorySize, Name}
62                             {StartTime, Id, PagedMemorySize, Name}
63                             {StartTime, Id, PagedMemorySize, Name}
64                             {StartTime, Id, PagedMemorySize, Name}
65                             {StartTime, Id, PagedMemorySize, Name}
66                             {StartTime, Id, PagedMemorySize, Name}

    TypeName: System.Collections.Hashtable



CSV-file convertation to Hashtable


0                              {StartTime, Id, PagedMemorySize, Name}
1                              {StartTime, Id, PagedMemorySize, Name}
2                              {StartTime, Id, PagedMemorySize, Name}
3                              {StartTime, Id, PagedMemorySize, Name}
4                              {StartTime, Id, PagedMemorySize, Name}
5                              {StartTime, Id, PagedMemorySize, Name}
6                              {StartTime, Id, PagedMemorySize, Name}
7                              {StartTime, Id, PagedMemorySize, Name}
8                              {StartTime, Id, PagedMemorySize, Name}
9                              {StartTime, Id, PagedMemorySize, Name}
10                             {StartTime, Id, PagedMemorySize, Name}
11                             {StartTime, Id, PagedMemorySize, Name}
12                             {StartTime, Id, PagedMemorySize, Name}
13                             {StartTime, Id, PagedMemorySize, Name}
14                             {StartTime, Id, PagedMemorySize, Name}
15                             {StartTime, Id, PagedMemorySize, Name}
16                             {StartTime, Id, PagedMemorySize, Name}
17                             {StartTime, Id, PagedMemorySize, Name}
18                             {StartTime, Id, PagedMemorySize, Name}
19                             {StartTime, Id, PagedMemorySize, Name}
20                             {StartTime, Id, PagedMemorySize, Name}
21                             {StartTime, Id, PagedMemorySize, Name}
22                             {StartTime, Id, PagedMemorySize, Name}
23                             {StartTime, Id, PagedMemorySize, Name}
24                             {StartTime, Id, PagedMemorySize, Name}
25                             {StartTime, Id, PagedMemorySize, Name}
26                             {StartTime, Id, PagedMemorySize, Name}
27                             {StartTime, Id, PagedMemorySize, Name}
28                             {StartTime, Id, PagedMemorySize, Name}
29                             {StartTime, Id, PagedMemorySize, Name}
30                             {StartTime, Id, PagedMemorySize, Name}
31                             {StartTime, Id, PagedMemorySize, Name}
32                             {StartTime, Id, PagedMemorySize, Name}
33                             {StartTime, Id, PagedMemorySize, Name}
34                             {StartTime, Id, PagedMemorySize, Name}
35                             {StartTime, Id, PagedMemorySize, Name}
36                             {StartTime, Id, PagedMemorySize, Name}
37                             {StartTime, Id, PagedMemorySize, Name}
38                             {StartTime, Id, PagedMemorySize, Name}
39                             {StartTime, Id, PagedMemorySize, Name}
40                             {StartTime, Id, PagedMemorySize, Name}
41                             {StartTime, Id, PagedMemorySize, Name}
42                             {StartTime, Id, PagedMemorySize, Name}
43                             {StartTime, Id, PagedMemorySize, Name}
44                             {StartTime, Id, PagedMemorySize, Name}
45                             {StartTime, Id, PagedMemorySize, Name}
46                             {StartTime, Id, PagedMemorySize, Name}
47                             {StartTime, Id, PagedMemorySize, Name}
48                             {StartTime, Id, PagedMemorySize, Name}
49                             {StartTime, Id, PagedMemorySize, Name}
50                             {StartTime, Id, PagedMemorySize, Name}
51                             {StartTime, Id, PagedMemorySize, Name}
52                             {StartTime, Id, PagedMemorySize, Name}
53                             {StartTime, Id, PagedMemorySize, Name}
54                             {StartTime, Id, PagedMemorySize, Name}
55                             {StartTime, Id, PagedMemorySize, Name}
56                             {StartTime, Id, PagedMemorySize, Name}
57                             {StartTime, Id, PagedMemorySize, Name}
58                             {StartTime, Id, PagedMemorySize, Name}
59                             {StartTime, Id, PagedMemorySize, Name}
60                             {StartTime, Id, PagedMemorySize, Name}
61                             {StartTime, Id, PagedMemorySize, Name}
62                             {StartTime, Id, PagedMemorySize, Name}
63                             {StartTime, Id, PagedMemorySize, Name}
64                             {StartTime, Id, PagedMemorySize, Name}
65                             {StartTime, Id, PagedMemorySize, Name}
66                             {StartTime, Id, PagedMemorySize, Name}

    TypeName: System.Collections.Hashtable



XML-file convertation to Hashtable


0                              {StartTime, Id, PagedMemorySize, Name}
1                              {StartTime, Id, PagedMemorySize, Name}
2                              {StartTime, Id, PagedMemorySize, Name}
3                              {StartTime, Id, PagedMemorySize, Name}
4                              {StartTime, Id, PagedMemorySize, Name}
5                              {StartTime, Id, PagedMemorySize, Name}
6                              {StartTime, Id, PagedMemorySize, Name}
7                              {StartTime, Id, PagedMemorySize, Name}
8                              {StartTime, Id, PagedMemorySize, Name}
9                              {StartTime, Id, PagedMemorySize, Name}
10                             {StartTime, Id, PagedMemorySize, Name}
11                             {StartTime, Id, PagedMemorySize, Name}
12                             {StartTime, Id, PagedMemorySize, Name}
13                             {StartTime, Id, PagedMemorySize, Name}
14                             {StartTime, Id, PagedMemorySize, Name}
15                             {StartTime, Id, PagedMemorySize, Name}
16                             {StartTime, Id, PagedMemorySize, Name}
17                             {StartTime, Id, PagedMemorySize, Name}
18                             {StartTime, Id, PagedMemorySize, Name}
19                             {StartTime, Id, PagedMemorySize, Name}
20                             {StartTime, Id, PagedMemorySize, Name}
21                             {StartTime, Id, PagedMemorySize, Name}
22                             {StartTime, Id, PagedMemorySize, Name}
23                             {StartTime, Id, PagedMemorySize, Name}
24                             {StartTime, Id, PagedMemorySize, Name}
25                             {StartTime, Id, PagedMemorySize, Name}
26                             {StartTime, Id, PagedMemorySize, Name}
27                             {StartTime, Id, PagedMemorySize, Name}
28                             {StartTime, Id, PagedMemorySize, Name}
29                             {StartTime, Id, PagedMemorySize, Name}
30                             {StartTime, Id, PagedMemorySize, Name}
31                             {StartTime, Id, PagedMemorySize, Name}
32                             {StartTime, Id, PagedMemorySize, Name}
33                             {StartTime, Id, PagedMemorySize, Name}
34                             {StartTime, Id, PagedMemorySize, Name}
35                             {StartTime, Id, PagedMemorySize, Name}
36                             {StartTime, Id, PagedMemorySize, Name}
37                             {StartTime, Id, PagedMemorySize, Name}
38                             {StartTime, Id, PagedMemorySize, Name}
39                             {StartTime, Id, PagedMemorySize, Name}
40                             {StartTime, Id, PagedMemorySize, Name}
41                             {StartTime, Id, PagedMemorySize, Name}
42                             {StartTime, Id, PagedMemorySize, Name}
43                             {StartTime, Id, PagedMemorySize, Name}
44                             {StartTime, Id, PagedMemorySize, Name}
45                             {StartTime, Id, PagedMemorySize, Name}
46                             {StartTime, Id, PagedMemorySize, Name}
47                             {StartTime, Id, PagedMemorySize, Name}
48                             {StartTime, Id, PagedMemorySize, Name}
49                             {StartTime, Id, PagedMemorySize, Name}
50                             {StartTime, Id, PagedMemorySize, Name}
51                             {StartTime, Id, PagedMemorySize, Name}
52                             {StartTime, Id, PagedMemorySize, Name}
53                             {StartTime, Id, PagedMemorySize, Name}
54                             {StartTime, Id, PagedMemorySize, Name}
55                             {StartTime, Id, PagedMemorySize, Name}
56                             {StartTime, Id, PagedMemorySize, Name}
57                             {StartTime, Id, PagedMemorySize, Name}
58                             {StartTime, Id, PagedMemorySize, Name}
59                             {StartTime, Id, PagedMemorySize, Name}
60                             {StartTime, Id, PagedMemorySize, Name}
61                             {StartTime, Id, PagedMemorySize, Name}
62                             {StartTime, Id, PagedMemorySize, Name}
63                             {StartTime, Id, PagedMemorySize, Name}
64                             {StartTime, Id, PagedMemorySize, Name}
65                             {StartTime, Id, PagedMemorySize, Name}
66                             {StartTime, Id, PagedMemorySize, Name}

    TypeName: System.Collections.Hashtable



YAML-file convertation to Hashtable


0                              {StartTime, Id, PagedMemorySize, Name}
1                              {StartTime, Id, PagedMemorySize, Name}
2                              {StartTime, Id, PagedMemorySize, Name}
3                              {StartTime, Id, PagedMemorySize, Name}
4                              {StartTime, Id, PagedMemorySize, Name}
5                              {StartTime, Id, PagedMemorySize, Name}
6                              {StartTime, Id, PagedMemorySize, Name}
7                              {StartTime, Id, PagedMemorySize, Name}
8                              {StartTime, Id, PagedMemorySize, Name}
9                              {StartTime, Id, PagedMemorySize, Name}
10                             {StartTime, Id, PagedMemorySize, Name}
11                             {StartTime, Id, PagedMemorySize, Name}
12                             {StartTime, Id, PagedMemorySize, Name}
13                             {StartTime, Id, PagedMemorySize, Name}
14                             {StartTime, Id, PagedMemorySize, Name}
15                             {StartTime, Id, PagedMemorySize, Name}
16                             {StartTime, Id, PagedMemorySize, Name}
17                             {StartTime, Id, PagedMemorySize, Name}
18                             {StartTime, Id, PagedMemorySize, Name}
19                             {StartTime, Id, PagedMemorySize, Name}
20                             {StartTime, Id, PagedMemorySize, Name}
21                             {StartTime, Id, PagedMemorySize, Name}
22                             {StartTime, Id, PagedMemorySize, Name}
23                             {StartTime, Id, PagedMemorySize, Name}
24                             {StartTime, Id, PagedMemorySize, Name}
25                             {StartTime, Id, PagedMemorySize, Name}
26                             {StartTime, Id, PagedMemorySize, Name}
27                             {StartTime, Id, PagedMemorySize, Name}
28                             {StartTime, Id, PagedMemorySize, Name}
29                             {StartTime, Id, PagedMemorySize, Name}
30                             {StartTime, Id, PagedMemorySize, Name}
31                             {StartTime, Id, PagedMemorySize, Name}
32                             {StartTime, Id, PagedMemorySize, Name}
33                             {StartTime, Id, PagedMemorySize, Name}
34                             {StartTime, Id, PagedMemorySize, Name}
35                             {StartTime, Id, PagedMemorySize, Name}
36                             {StartTime, Id, PagedMemorySize, Name}
37                             {StartTime, Id, PagedMemorySize, Name}
38                             {StartTime, Id, PagedMemorySize, Name}
39                             {StartTime, Id, PagedMemorySize, Name}
40                             {StartTime, Id, PagedMemorySize, Name}
41                             {StartTime, Id, PagedMemorySize, Name}
42                             {StartTime, Id, PagedMemorySize, Name}
43                             {StartTime, Id, PagedMemorySize, Name}
44                             {StartTime, Id, PagedMemorySize, Name}
45                             {StartTime, Id, PagedMemorySize, Name}
46                             {StartTime, Id, PagedMemorySize, Name}
47                             {StartTime, Id, PagedMemorySize, Name}
48                             {StartTime, Id, PagedMemorySize, Name}
49                             {StartTime, Id, PagedMemorySize, Name}
50                             {StartTime, Id, PagedMemorySize, Name}
51                             {StartTime, Id, PagedMemorySize, Name}
52                             {StartTime, Id, PagedMemorySize, Name}
53                             {StartTime, Id, PagedMemorySize, Name}
54                             {StartTime, Id, PagedMemorySize, Name}
55                             {StartTime, Id, PagedMemorySize, Name}
56                             {StartTime, Id, PagedMemorySize, Name}
57                             {StartTime, Id, PagedMemorySize, Name}
58                             {StartTime, Id, PagedMemorySize, Name}
59                             {StartTime, Id, PagedMemorySize, Name}
60                             {StartTime, Id, PagedMemorySize, Name}
61                             {StartTime, Id, PagedMemorySize, Name}
62                             {StartTime, Id, PagedMemorySize, Name}
63                             {StartTime, Id, PagedMemorySize, Name}
64                             {StartTime, Id, PagedMemorySize, Name}
65                             {StartTime, Id, PagedMemorySize, Name}
66                             {StartTime, Id, PagedMemorySize, Name}

    TypeName: System.Collections.Hashtable
#>
