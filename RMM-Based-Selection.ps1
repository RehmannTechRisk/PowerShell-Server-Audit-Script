$path = "C:\\temp\\$env:computername Server Audit"
New-Item -ItemType directory -Path $path

Net LocalGroup Administrators | Out-File "path\1.Local_Admins.txt" ;

net user guest | Out-File "path\2.Guests.txt" ;

systeminfo | Out-File "path\3.SysteminfoandUpdates.txt" ;

wmic qfe list | Out-File "path\3.SysteminfoandUpdates.txt" -append ;

gpresult -h "path\4.ServerFollowedGPOs.html" ;

vaultcmd /listschema | Out-File "path\5.CredentialManager.txt" ;

vaultcmd /list | Out-File "path\5.CredentialManager.txt" -append ;

net share | Out-File "path\6.Shares.txt" ;

dir C:\Users | Out-File "path\7.UsersOnHost.txt" ;

netsh advfirewall show allprofiles | Out-File "path\8.WindowsFirewall.txt" ;

powercfg /A | Out-File "path\9.SleepMode.txt" ;

ipconfig /all | Out-File "path\10.BridgedAdapters.txt" ;

auditpol.exe /get /category:* | Out-File "path\11.AuditPolicySettings.txt"

Get-WinEvent -FilterHashtable @{logname = ‘setup’} | Export-CSV "path\12.Patches.csv"

$zipPath = "$path.zip"
Compress-Archive -Path $path -DestinationPath $zipPath