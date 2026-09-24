<#
.SYNOPSIS
    This PowerShell script configures Windows Ink Workspace to prevent access above the lock screen.

.NOTES
    Author          : Khatab Aied
    LinkedIn        : N/A
    GitHub          : github.com/khatabaied
    Date Created    : 2026-09-24
    Last Modified   : 2026-09-24
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000385
    Documentation   : https://dl.dod.cyber.mil/wp-content/uploads/stigs/zip/U_MS_Windows_11_V2R9_STIG.zip

.TESTED ON
    Date(s) Tested  :
    Tested By       :
    Systems Tested  :
    PowerShell Ver. :

.USAGE
    Run PowerShell as Administrator.
    PS C:\> .\KA-WN11-CC-000385.ps1
#>

$RegistryPath = "HKLM:\SOFTWARE\Policies\Microsoft\WindowsInkWorkspace"

New-Item -Path $RegistryPath -Force | Out-Null

New-ItemProperty `
    -Path $RegistryPath `
    -Name "AllowWindowsInkWorkspace" `
    -PropertyType DWord `
    -Value 1 `
    -Force | Out-Null
