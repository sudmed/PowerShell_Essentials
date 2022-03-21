# PowerShell Essentials Output and Format View Homework
# 1. Write a script to list directory that contain files. Output is the same with Get-ChildItem cmdlet. Print file size in megabytes (Mb).

$inputPath = $args[0]
Get-ChildItem -Path $inputPath | Format-Table -Property @{Name="Mode";Expression={($_.mode)};Width=14},@{Name="LastWriteTime";Expression={($_.LastWriteTime)};Width=20},@{Name="Length(MB)";Expression={"{0:N2}" -f ($_.length/1MB)};Width=14;Alignment="Right"},@{Name="Name";Expression={($_.name)};Width=50}

# > & .\DirectorySize.ps1 "C:\Windows\ShellExperiences"
<# Output
Mode           LastWriteTime            Length(MB) Name
----           -------------            ---------- ----
la---          26.01.2022 16:11:22            1,55 JumpViewUI.dll
la---          26.01.2022 16:11:22            2,04 NetworkUX.dll
la---          09.10.2020 23:47:07            0,41 PeopleBarContainer.dll
la---          09.10.2020 23:47:07            1,34 PeopleBarFlyout.dll
la---          09.10.2020 23:47:07            0,44 PeopleBarJumpView.dll
la---          26.01.2022 16:11:22            1,86 PeopleCommonControls.dll
la---          26.01.2022 16:11:31            2,23 PeoplePane.dll
la---          26.01.2022 16:11:22            1,73 QuickActions.dll
la---          09.10.2020 23:47:07            0,56 ShoulderTapView.dll
la---          07.12.2019 12:08:16            0,48 TileControl.dll
la---          26.10.2021 22:15:36            2,76 WindowsInternal.People.PeoplePicker.dll
la---          07.12.2019 12:08:41            2,23 WindowsInternal.People.Relevance.dll
la---          07.12.2019 12:08:41            0,53 WindowsInternal.People.Relevance.QueryClient.dll
#>

# > Get-ChildItem "C:\Windows\ShellExperiences"
<# Output
Directory: C:\Windows\ShellExperiences
Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a---          26.01.2022    16:11        1624064 JumpViewUI.dll
-a---          26.01.2022    16:11        2135552 NetworkUX.dll
-a---          09.10.2020    23:47         432640 PeopleBarContainer.dll
-a---          09.10.2020    23:47        1410048 PeopleBarFlyout.dll
-a---          09.10.2020    23:47         459776 PeopleBarJumpView.dll
-a---          26.01.2022    16:11        1953792 PeopleCommonControls.dll
-a---          26.01.2022    16:11        2340352 PeoplePane.dll
-a---          26.01.2022    16:11        1808896 QuickActions.dll
-a---          09.10.2020    23:47         592384 ShoulderTapView.dll
-a---          07.12.2019    12:08         499200 TileControl.dll
-a---          26.10.2021    22:15        2892288 WindowsInternal.People.PeoplePicker.dll
-a---          07.12.2019    12:08        2337280 WindowsInternal.People.Relevance.dll
-a---          07.12.2019    12:08         554496 WindowsInternal.People.Relevance.QueryClient.dll
#>
