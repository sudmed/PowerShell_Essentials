# PowerShell Essentials WMI and CIM Homework
# 2. Write a script to get all interactive and remote logon sessions for the selected remote computer. 
    # And for every session find associated user information.
    # Hint: use classes Win32_LogonSession and Win32_Account.

<# Code starts here #>
$computers = Get-Content -Path ".\computers.txt"
foreach ($computer in $computers) {
   Write-Host $computer -ForegroundColor Green
   query user /server:$computer
   ""
   (Get-CimInstance -computername $computer -ClassName Win32_ComputerSystem).UserName
   Get-CimInstance -computername $computer -ClassName Win32_Logonsession |
   Where-Object LogonType -in @(0..11) |
   ForEach-Object {
        switch ($_.LogonType){
            0 {$type = ‘Local System’}
            1 {$type = ‘Broken! Unrecognised logon type’}
            2 {$type = ‘Interactive Session’}
            3 {$type = ‘Network (Remote logon)’}
            4 {$type = ‘Batch (Scheduled task)’}
            5 {$type = ‘Service (Service account logon)’}
            6 {$type = ‘Proxy’}
            7 {$type = ‘Unlock (Screen saver)’}
            8 {$type = ‘NetworkCleartext (Cleartext network logon)’}
            9 {$type = ‘NewCredentials (RunAs using alternate credentials)’}
            10 {$type = ‘RemoteInteractive (RDP\TS\RemoteAssistance)’}
            11 {$type = ‘CachedInteractive (Local w\cached credentials)’}
            default {throw “Broken! Unrecognised logon type” }
        }
   
       $user = Get-CimAssociatedInstance -InputObject $_ -ResultClassName Win32_Account
        $props = [ordered]@{
            Name = $user.Name
            Domain = $user.Domain
            SessionType = $type
            LogonTime = $_.StartTime
            Authentication = $_.AuthenticationPackage
            Local = $user.LocalAccount
        }
        if ($props.Name) {New-Object -TypeName PSobject -Property $props}
   }
   
    Write-Host "============================================================================="
}
<# Code ends here #>


<# Executing script
& .\hometask2@13_WMI_and_CIM.ps1
DESKTOP-QU2SL0U
 ПОЛЬЗОВАТЕЛЬ          СЕАНС              ID  СТАТУС  БЕЗДЕЙСТВ. ВРЕМЯ ВХОДА
 admin                 console             2  Активно   отсутствует 26.03.2022 22:40

DESKTOP-QU2SL0U\admin

Name           : admin
Domain         : DESKTOP-QU2SL0U
SessionType    : Interactive Session
LogonTime      : 26.03.2022 22:40:24
Authentication : NTLM
Local          : True

Name           : admin
Domain         : DESKTOP-QU2SL0U
SessionType    : Network (Remote logon)
LogonTime      : 27.03.2022 21:36:21
Authentication : NTLM
Local          : True

Name           : admin
Domain         : DESKTOP-QU2SL0U
SessionType    : Interactive Session
LogonTime      : 26.03.2022 22:40:24
Authentication : NTLM
Local          : True

Name           : admin
Domain         : DESKTOP-QU2SL0U
SessionType    : Interactive Session
LogonTime      : 26.03.2022 21:43:41
Authentication : NTLM
Local          : True

Name           : admin
Domain         : DESKTOP-QU2SL0U
SessionType    : Interactive Session
LogonTime      : 26.03.2022 21:43:41
Authentication : NTLM
Local          : True

=============================================================================
DESKTOP-V8J7U0E
 ПОЛЬЗОВАТЕЛЬ          СЕАНС              ID  СТАТУС  БЕЗДЕЙСТВ. ВРЕМЯ ВХОДА
 admin                 rdp-tcp#3           2  Активно         10  27.03.2022 21:18

Name           : СИСТЕМА
Domain         : DESKTOP-V8J7U0E
SessionType    : Local System
LogonTime      : 27.03.2022 21:17:54
Authentication : NTLM
Local          : True

Name           : LOCAL SERVICE
Domain         : DESKTOP-V8J7U0E
SessionType    : Service (Service account logon)
LogonTime      : 27.03.2022 21:17:55
Authentication : Negotiate
Local          : True

Name           : NETWORK SERVICE
Domain         : DESKTOP-V8J7U0E
SessionType    : Service (Service account logon)
LogonTime      : 27.03.2022 21:17:55
Authentication : Negotiate
Local          : True

Name           : admin
Domain         : DESKTOP-V8J7U0E
SessionType    : RemoteInteractive (RDP\TS\RemoteAssistance)
LogonTime      : 27.03.2022 21:18:57
Authentication : NTLM
Local          : True

Name           : admin
Domain         : DESKTOP-V8J7U0E
SessionType    : RemoteInteractive (RDP\TS\RemoteAssistance)
LogonTime      : 27.03.2022 21:18:57
Authentication : NTLM
Local          : True

Name           : admin
Domain         : DESKTOP-V8J7U0E
SessionType    : Network (Remote logon)
LogonTime      : 27.03.2022 21:46:35
Authentication : NTLM
Local          : True

Name           : admin
Domain         : DESKTOP-V8J7U0E
SessionType    : Network (Remote logon)
LogonTime      : 27.03.2022 21:40:23
Authentication : NTLM
Local          : True

Name           : admin
Domain         : DESKTOP-V8J7U0E
SessionType    : Network (Remote logon)
LogonTime      : 27.03.2022 21:20:06
Authentication : NTLM
Local          : True

Name           : admin
Domain         : DESKTOP-V8J7U0E
SessionType    : Network (Remote logon)
LogonTime      : 27.03.2022 21:18:55
Authentication : NTLM
Local          : True

Name           : АНОНИМНЫЙ ВХОД
Domain         : DESKTOP-V8J7U0E
SessionType    : Network (Remote logon)
LogonTime      : 27.03.2022 21:18:11
Authentication : NTLM
Local          : True

=============================================================================
julia-pc
Ошибка 0x00000005 перечисления сеансов
Ошибка [5]:Отказано в доступе.

julia-pc\admin
Name           : система
Domain         : JULIA-PC
SessionType    : Local System
LogonTime      : 27.03.2022 16:24:15
Authentication : NTLM
Local          : True

Name           : LOCAL SERVICE
Domain         : JULIA-PC
SessionType    : Service (Service account logon)
LogonTime      : 27.03.2022 16:24:16
Authentication : Negotiate
Local          : True

Name           : NETWORK SERVICE
Domain         : JULIA-PC
SessionType    : Service (Service account logon)
LogonTime      : 27.03.2022 16:24:16
Authentication : Negotiate
Local          : True

Name           : admin
Domain         : julia-pc
SessionType    : Interactive Session
LogonTime      : 27.03.2022 16:24:16
Authentication : NTLM
Local          : True

Name           : admin
Domain         : julia-pc
SessionType    : Network (Remote logon)
LogonTime      : 27.03.2022 21:46:24
Authentication : NTLM
Local          : True

Name           : admin
Domain         : julia-pc
SessionType    : Network (Remote logon)
LogonTime      : 27.03.2022 21:46:24
Authentication : NTLM
Local          : True

Name           : admin
Domain         : julia-pc
SessionType    : Network (Remote logon)
LogonTime      : 27.03.2022 21:46:24
Authentication : NTLM
Local          : True

Name           : admin
Domain         : julia-pc
SessionType    : Interactive Session
LogonTime      : 27.03.2022 16:24:16
Authentication : NTLM
Local          : True

Name           : АНОНИМНЫЙ ВХОД
Domain         : JULIA-PC
SessionType    : Network (Remote logon)
LogonTime      : 27.03.2022 16:24:18
Authentication : NTLM
Local          : True

=============================================================================
#>
