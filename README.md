\# PowerShell-Server-Audit-Script

\# A PowerShell script which can be copied/pasted into a PowerShell console window and retrieve auditable server configuration settings. This script only runs a series a queries (it does not make any modifications) and then creates a folder on the currently logged in user's desktop nameded after the computer name which can then be zipped and uploaded as supporting documentation.

\# PLEASE NOTE:

\# This script needs to be run as a Domain Administrator on each Domain Controller being audited seperately.

\# Search for: c:\windows\system32\windowspowershell\v1.0\powershell.exe, right click the application result and select "run as administrator".

\# Next, simply copy the entire blob of text below and paste into the PowerShell window.

New-Item -ItemType directory -Path "$($env:USERPROFILE)\Desktop\\$env:computername Server Audit" ; Net LocalGroup Administrators | Out-File "$($env:USERPROFILE)\Desktop\\$env:computername Server Audit\1.Local_Admins.txt" ; net user guest | Out-File "$($env:USERPROFILE)\Desktop\\$env:computername Server Audit\2.Guests.txt" ; systeminfo | Out-File "$($env:USERPROFILE)\Desktop\\$env:computername Server Audit\3.SysteminfoandUpdates.txt" ; wmic qfe list | Out-File "$($env:USERPROFILE)\Desktop\\$env:computername Server Audit\3.SysteminfoandUpdates.txt" -append ; gpresult -h "$($env:USERPROFILE)\Desktop\\$env:computername Server Audit\4.ServerFollowedGPOs.html" ; vaultcmd /listschema | Out-File "$($env:USERPROFILE)\Desktop\\$env:computername Server Audit\5.CredentialManager.txt" ; vaultcmd /list | Out-File "$($env:USERPROFILE)\Desktop\\$env:computername Server Audit\5.CredentialManager.txt" -append ; net share | Out-File "$($env:USERPROFILE)\Desktop\\$env:computername Server Audit\6.Shares.txt" ; dir C:\Users | Out-File "$($env:USERPROFILE)\Desktop\\$env:computername Server Audit\7.UsersOnHost.txt" ; netsh advfirewall show allprofiles | Out-File "$($env:USERPROFILE)\Desktop\\$env:computername Server Audit\8.WindowsFirewall.txt" ; powercfg /A | Out-File "$($env:USERPROFILE)\Desktop\\$env:computername Server Audit\9.SleepMode.txt" ; ipconfig /all | Out-File "$($env:USERPROFILE)\Desktop\\$env:computername Server Audit\10.BridgedAdapters.txt" ; auditpol.exe /get /category:* | Out-File "$($env:USERPROFILE)\Desktop\\$env:computername Server Audit\11.AuditPolicySettings.txt"
