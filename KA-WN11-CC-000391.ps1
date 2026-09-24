<#
.SYNOPSIS
    This PowerShell script disables Internet Explorer 11 as a standalone browser and configures the notification option to Never.

.NOTES
    Author          : Khatab Aied
    LinkedIn        : N/A
    GitHub          : github.com/khatabaied
    Date Created    : 2026-09-24
    Last Modified   : 2026-09-24
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000391
    Documentation   : https://dl.dod.cyber.mil/wp-content/uploads/stigs/zip/U_MS_Windows_11_V2R9_STIG.zip

.TESTED ON
    Date(s) Tested  :
    Tested By       :
    Systems Tested  :
    PowerShell Ver. :

.USAGE
    Run PowerShell as Administrator.
    PS C:\> .\KA-WN11-CC-000391.ps1
#>

$RegistryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\Main"

New-Item -Path $RegistryPath -Force | Out-Null

New-ItemProperty `
    -Path $RegistryPath `
    -Name "NotifyDisableIEOptions" `
    -PropertyType DWord `
    -Value 0 `
    -Force | Out-Null
