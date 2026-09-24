<#
.SYNOPSIS
    This PowerShell script renames the built-in Windows Guest account so it does not retain the default Guest account name.

.NOTES
    Author          : Khatab Aied
    LinkedIn        : N/A
    GitHub          : github.com/khatabaied
    Date Created    : 2026-09-24
    Last Modified   : 2026-09-24
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-SO-000025
    Documentation   : https://dl.dod.cyber.mil/wp-content/uploads/stigs/zip/U_MS_Windows_11_V2R9_STIG.zip

.TESTED ON
    Date(s) Tested  :
    Tested By       :
    Systems Tested  :
    PowerShell Ver. :

.USAGE
    Run PowerShell as Administrator.
    PS C:\> .\KA-WN11-SO-000025.ps1
#>

$GuestAccount = Get-LocalUser |
    Where-Object { $_.SID.Value -match "-501$" }

if (-not $GuestAccount) {
    Write-Error "Built-in Guest account could not be located."
    exit 1
}

$NewGuestName = "LocalGuestDisabled"

Rename-LocalUser `
    -Name $GuestAccount.Name `
    -NewName $NewGuestName
