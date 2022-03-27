# PowerShell Essentials WMI and CIM Homework
# 1. Write a script to get from selected remote computer the following data:
    #CPU model and max clock speed
    #Amount of RAM (total, free)
    #OS disk free space
    #OS version
    #Installed hot fixes
    #List of stopped services

<# Code starts here #>
$computers = Get-Content -Path ".\computers.txt"
foreach ($computer in $computers) {
    Write-Host $computer -ForegroundColor Green
    
    Write-Host "CPU model, max clock speed: " (Get-CimInstance -ClassName Win32_Processor -computername $computer |
        Select-Object -ExcludeProperty "CIM*").Name
    
    Write-Host "RAM total:                  " (Get-CimInstance -ClassName Win32_PhysicalMemory -computername $computer |
        Measure-Object -Property capacity -Sum |
            ForEach-Object {"{0:N1}" -f ([math]::round(($_.Sum / 1GB),2))}) Gb
    
    Write-Host "RAM free:                   " (Get-CimInstance -ClassName Win32_OperatingSystem -computername $computer |
        ForEach-Object {"{0:N1}" -f ([math]::round(($_.FreePhysicalMemory / 1MB),2))}) Gb
    
    Write-Host "OS disk free space:         " (Get-CimInstance -computername $computer -ClassName win32_logicaldisk |
        Where-Object caption -eq ((Get-CimInstance -computername $computer Win32_OperatingSystem).SystemDrive) |
            foreach-object {Write-Output "$('{0:N1}' -f ($_.FreeSpace/1gb)) GB"})
    
    Write-Host "OS version:                 " (Get-CimInstance -computername $computer -ClassName `
        Win32_OperatingSystem).Caption
    
    Write-Host "Installed hot fixes:        " (Get-CimInstance -computername $computer -ClassName `
        Win32_QuickFixEngineering -Property HotFixId).HotFixId
    
    Write-Host "List of stopped services:   " (Get-CimInstance -computername $computer -ClassName `
        Win32_Service -filter "state='stopped'").Name
    
    Write-Host "======================================================================"
    }
<# Code ends here #>


<# Executing the script
& .\hometask1@13_WMI_and_CIM.ps1
DESKTOP-QU2SL0U
CPU model, max clock speed:  Intel(R) Core(TM) i5-10600K CPU @ 4.10GHz
RAM total:                   48,0 Gb
RAM free:                    36,8 Gb
OS disk free space:          785,6 GB
OS version:                  Майкрософт Windows 10 Pro
Installed hot fixes:         KB5010472 KB4562830 KB4570334 KB4577266 KB4577586 KB4580325 KB4589212 KB5000736 KB5003791 KB5011543 KB5006753 KB5007273 KB5009636 KB5011352 KB5011651 KB5005699
List of stopped services:    AJRouter ALG AppIDSvc AppleChargerSrv AppMgmt AppReadiness AppVClient AppXSvc AssignedAccessManagerSvc autotimesvc AxInstSV BDESVC BITS BrYNSvc ClipSVC cloudidsvc COMSysApp cphs cplspcon CscService defragsvc DeviceInstall DevQueryBroker diagnosticshub.standardcollector.service diagsvc DialogBlockingService DisplayEnhancementService DmEnrollmentSvc dmwappushservice DoSvc dot3svc DsmSvc Eaphost edgeupdate edgeupdatem embeddedmode EntAppSvc Fax fhsvc FrameServer FvSvc gcs GoogleChromeElevationService gpsvc GraphicsPerfSvc gupdate gupdatem HgClientService HwmRecordService icssvc igfxCUIService2.0.0.0 Intel(R) Capability Licensing Service TCP IP Interface Intel(R) TPM Provisioning Service IpxlatCfgSvc KtmRm lfsvc lltdsvc LxpSvc MapsBroker MicrosoftEdgeElevationService MixedRealityOpenXRSvc MozillaMaintenance MSDTC MSiSCSI msiserver MsKeyboardFilter NaturalAuthentication NcaSvc Netlogon Netman NetTcpPortSharing NgcCtnrSvc NgcSvc OcButtonService ose p2pimsvc p2psvc PeerDistSvc perceptionsimulation PerfHost pla PNRPAutoReg PNRPsvc PrintNotify PsShutdownSvc PushToInstall QWAVE RasAuto RemoteAccess RemoteRegistry RetailDemo RpcLocator SCardSvr ScDeviceEnum SCPolicySvc SDRSVC seclogon Sense SensorDataService SensorService SensrSvc SessionEnv SharedRealitySvc shpamsvc smphost SmsRouter SNMPTRAP spectrum sppsvc ssh-agent svsvc swprv TapiSrv TermService TieringEngineService TroubleshootingSvc tzautoupdate UevAgentService uhssvc UmRdpService upnphost VacSvc vds vmicguestinterface vmicheartbeat vmickvpexchange vmicrdv vmicshutdown vmictimesync vmicvmsession vmicvss VSS W32Time WaaSMedicSvc WalletService WarpJITSvc wbengine wcncsvc WdiSystemHost WdNisSvc WebClient Wecsvc WEPHOSTSVC wercplsupport WerSvc WFDSConMgrSvc WiaRpc WinDefend wisvc WlanSvc wlidsvc wlpasvc WManSvc wmiApSrv WMPNetworkSvc workfolderssvc WpcMonSvc WPDBusEnum wuauserv WwanSvc XblAuthManager XblGameSave XboxGipSvc XboxNetApiSvc AarSvc_2139266 BcastDVRUserService_2139266 BluetoothUserService_2139266 CaptureService_2139266 ConsentUxUserSvc_2139266 CredentialEnrollmentManagerUserSvc_2139266 DeviceAssociationBrokerSvc_2139266 DevicePickerUserSvc_2139266 DevicesFlowUserSvc_2139266 LxssManagerUser_2139266 MessagingService_2139266 PrintWorkflowUserSvc_2139266 UdkUserSvc_2139266
======================================================================
DESKTOP-V8J7U0E
CPU model, max clock speed:  Intel(R) Core(TM) i5-6300U CPU @ 2.40GHz
RAM total:                   16,0 Gb
RAM free:                    12,5 Gb
OS disk free space:          658,5 GB
OS version:                  Майкрософт Windows 10 Pro
Installed hot fixes:         KB5010472 KB5003791 KB5011543 KB5007273 KB5009636 KB5011352 KB5011651 KB5005699
List of stopped services:    AJRouter ALG AppIDSvc AppMgmt AppReadiness AppVClient AssignedAccessManagerSvc autotimesvc AxInstSV BITS CertPropSvc ClipSVC cloudidsvc COMSysApp CscService defragsvc DeviceInstall DevQueryBroker diagnosticshub.standardcollector.service diagsvc DialogBlockingService DmEnrollmentSvc dmwappushservice DoSvc dot3svc DPS DsmSvc DsSvc Eaphost edgeupdate edgeupdatem EFS embeddedmode EntAppSvc Fax fhsvc FrameServer GoogleChromeElevationService gpsvc GraphicsPerfSvc gupdate gupdatem HgClientService hidserv icssvc IKEEXT Intel(R) Capability Licensing Service TCP IP Interface Intel(R) TPM Provisioning Service IpxlatCfgSvc KtmRm lltdsvc LPlatSvc LxpSvc LxssManager MapsBroker MicrosoftEdgeElevationService MixedRealityOpenXRSvc MSDTC MSiSCSI msiserver MsKeyboardFilter NaturalAuthentication NcaSvc Netlogon Netman NetSetupSvc NetTcpPortSharing p2pimsvc p2psvc PeerDistSvc perceptionsimulation PerfHost PhoneSvc pla PNRPAutoReg PNRPsvc PolicyAgent PrintNotify PushToInstall QHProtected QWAVE RasAuto RemoteAccess RemoteRegistry RetailDemo RpcLocator SCardSvr ScDeviceEnum SCPolicySvc SDRSVC seclogon SEMgrSvc Sense SensorDataService SensorService SensrSvc SessionEnv SharedRealitySvc shpamsvc smphost SmsRouter SNMPTRAP spectrum sppsvc ssh-agent stisvc SUService svsvc swprv SysMain TapiSrv TermService TieringEngineService TrkWks TroubleshootingSvc tzautoupdate UevAgentService uhssvc UmRdpService upnphost VacSvc vds vmicguestinterface vmicheartbeat vmickvpexchange vmicrdv vmicshutdown vmictimesync vmicvmsession vmicvss VSS W32Time WaaSMedicSvc WalletService WarpJITSvc wbengine wcncsvc WdiServiceHost WdiSystemHost WdNisSvc WebClient Wecsvc WEPHOSTSVC wercplsupport WerSvc WFDSConMgrSvc WiaRpc WinDefend wisvc wlidsvc wlpasvc WManSvc wmiApSrv WMPNetworkSvc workfolderssvc WpcMonSvc WPDBusEnum wuauserv WwanSvc XblAuthManager XblGameSave XboxGipSvc XboxNetApiSvc AarSvc_78b8b6 BcastDVRUserService_78b8b6 BluetoothUserService_78b8b6 CaptureService_78b8b6 ConsentUxUserSvc_78b8b6 CredentialEnrollmentManagerUserSvc_78b8b6 DeviceAssociationBrokerSvc_78b8b6 DevicePickerUserSvc_78b8b6 DevicesFlowUserSvc_78b8b6 LxssManagerUser_78b8b6 MessagingService_78b8b6 PrintWorkflowUserSvc_78b8b6 UdkUserSvc_78b8b6
======================================================================
julia-pc
CPU model, max clock speed:  Intel(R) Core(TM) i5-3470 CPU @ 3.20GHz
RAM total:                   8,0 Gb
RAM free:                    5,8 Gb
OS disk free space:          45,9 GB
OS version:                  Microsoft Windows 7 Профессиональная
Installed hot fixes:         KB2849697 KB2849697 KB2849696 KB2849696 KB2841134 KB2841134 KB2670838 KB2830477 KB2592687 KB971033 KB917607 KB3191566 KB2533552 KB2545698 KB2547666 KB2574819 KB2603229 KB2639308 KB2667402 KB2676562 KB2685811 KB2685813 KB2698365 KB2716513 KB2719033 KB2729094 KB2732059 KB2750841 KB2761217 KB2773072 KB2809215 KB2813347 KB2818604 KB2834140 KB2862330 KB2862973 KB2884256 KB2894844 KB2898785 KB2900986 KB2909210 KB2909921 KB2919469 KB2920188 KB2925418 KB2929437 KB2952664 KB2961851 KB2962872 KB2970228 KB2976627 KB2977629 KB2984972 KB2987107 KB2990214 KB2999226 KB3000483 KB3003057 KB3004375 KB3006137 KB3008923 KB3020369 KB3020370 KB3020393 KB3021917 KB3021952 KB3022345 KB3025390 KB3032359 KB3034196 KB3038314 KB3046269 KB3049563 KB3058515 KB3059317 KB3064209 KB3065822 KB3065987 KB3068708 KB3074886 KB3075516 KB3075851 KB3078071 KB3080149 KB3083324 KB3083710 KB3087038 KB3087985 KB3093983 KB3100773 KB3102429 KB3102810 KB3118401 KB3121461 KB3123479 KB3125574 KB3138378 KB3138612 KB3140245 KB3142024 KB3146706 KB3146963 KB3147071 KB3149090 KB3150513 KB3156016 KB3159398 KB3161102 KB3161949 KB3172605 KB3177467 KB3179573 KB3184143 KB3210131 KB4019990 KB4054998 KB4474419 KB4490628 KB4507004 KB4528069 KB4532945 KB4538483 KB4550735 KB976902 KB4540688
List of stopped services:    AdobeARMservice AeLookupSvc ALG AmmyyAdmin_404 AppIDSvc Appinfo AppMgmt asComSvc asHmComSvc aspnet_state AsSysCtrlService AxInstSV BDESVC bthserv clr_optimization_v2.0.50727_32 clr_optimization_v2.0.50727_64 clr_optimization_v4.0.30319_32 clr_optimization_v4.0.30319_64 COMSysApp cphs defragsvc DiagTrack Disc Soft Lite Bus Service dot3svc EFS ehRecvr ehSched Fax fdPHost FDResPub FontCache3.0.0.0 GoogleChromeElevationService gupdate gupdatem hkmsvc HomeGroupListener HomeGroupProvider idsvc IEEtwCollectorService IKEEXT IPBusEnum KtmRm lltdsvc Mcx2Svc MMCSS MSDTC MSiSCSI msiserver napagent Netlogon NetMsmqActivator NetPipeActivator NetTcpActivator NetTcpPortSharing ose p2pimsvc p2psvc PeerDistSvc PerfHost pla PNRPAutoReg PNRPsvc ProtectedStorage QWAVE RasAuto RasMan RemoteAccess RemoteRegistry RpcLocator SCardSvr SCPolicySvc SDRSVC seclogon SensrSvc SharedAccess SNMPTRAP sppsvc sppuinotify SstpSvc stisvc StorSvc swprv SysMain TabletInputService TapiSrv THREADORDER UI0Detect upnphost VaultSvc vds VSS W32Time WatAdminSvc wbengine WbioSrvc wcncsvc WcsPlugInService WdiSystemHost WebClient Wecsvc wercplsupport WerSvc WiaRpc WinDefend WinHttpAutoProxySvc wmiApSrv WPCSvc WPDBusEnum wudfsvc WwanSvc
======================================================================
#>
