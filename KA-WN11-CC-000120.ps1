<#
.SYNOPSIS
    This PowerShell script prevents the network selection user interface from being displayed on the Windows 11 logon screen.

.NOTES
    Author          : Khatab Aied
    LinkedIn        : N/A
    GitHub          : github.com/khatabaied
    Date Created    : 2026-09-23
    Last Modified   : 2026-09-23
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000120
    Documentation   : https://dl.dod.cyber.mil/wp-content/uploads/stigs/zip/U_MS_Windows_11_V2R9_STIG.zip

.TESTED ON
    Date(s) Tested  :
    Tested By       :
    Systems Tested  :
    PowerShell Ver. :

.USAGE
    Run PowerShell as Administrator.
    PS C:\> .\KA-WN11-CC-000120.ps1
#>

$RegistryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System"

New-Item -Path $RegistryPath -Force | Out-Null

New-ItemProperty `
    -Path $RegistryPath `
    -Name "DontDisplayNetworkSelectionUI" `
    -PropertyType DWord `
    -Value 1 `
    -Force | Out-Null
