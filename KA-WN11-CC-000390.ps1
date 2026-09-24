<#
.SYNOPSIS
    This PowerShell script prevents third-party application and content suggestions from appearing in Windows Spotlight.

.NOTES
    Author          : Khatab Aied
    LinkedIn        : N/A
    GitHub          : github.com/khatabaied
    Date Created    : 2026-09-24
    Last Modified   : 2026-09-24
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000390
    Documentation   : https://dl.dod.cyber.mil/wp-content/uploads/stigs/zip/U_MS_Windows_11_V2R9_STIG.zip

.TESTED ON
    Date(s) Tested  :
    Tested By       :
    Systems Tested  :
    PowerShell Ver. :

.USAGE
    Run PowerShell as Administrator.
    PS C:\> .\KA-WN11-CC-000390.ps1
#>

$AdminAccount = Get-CimInstance Win32_UserAccount -Filter "LocalAccount=True" |
    Where-Object { $_.SID -match "-500$" }

$SID = $AdminAccount.SID
$RegistryPath = "Registry::HKEY_USERS\$SID\Software\Policies\Microsoft\Windows\CloudContent"

New-Item -Path $RegistryPath -Force | Out-Null

New-ItemProperty `
    -Path $RegistryPath `
    -Name "DisableThirdPartySuggestions" `
    -PropertyType DWord `
    -Value 1 `
    -Force | Out-Null
