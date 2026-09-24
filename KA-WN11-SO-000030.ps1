<#
.SYNOPSIS
    This PowerShell script enables advanced audit policy subcategories to override legacy audit policy category settings.

.NOTES
    Author          : Khatab Aied
    LinkedIn        : N/A
    GitHub          : github.com/khatabaied
    Date Created    : 2026-09-24
    Last Modified   : 2026-09-24
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-SO-000030
    Documentation   : https://dl.dod.cyber.mil/wp-content/uploads/stigs/zip/U_MS_Windows_11_V2R9_STIG.zip

.TESTED ON
    Date(s) Tested  :
    Tested By       :
    Systems Tested  :
    PowerShell Ver. :

.USAGE
    Run PowerShell as Administrator.
    PS C:\> .\KA-WN11-SO-000030.ps1
#>

$RegistryPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa"

New-ItemProperty `
    -Path $RegistryPath `
    -Name "SCENoApplyLegacyAuditPolicy" `
    -PropertyType DWord `
    -Value 1 `
    -Force | Out-Null
