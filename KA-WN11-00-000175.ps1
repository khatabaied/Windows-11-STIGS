<#
.SYNOPSIS
    This PowerShell script disables the Windows Secondary Logon service.

.NOTES
    Author          : Khatab Aied
    LinkedIn        : N/A
    GitHub          : github.com/khatabaied
    Date Created    : 2026-09-23
    Last Modified   : 2026-09-23
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-00-000175
    Documentation   : https://dl.dod.cyber.mil/wp-content/uploads/stigs/zip/U_MS_Windows_11_V2R9_STIG.zip

.TESTED ON
    Date(s) Tested  :
    Tested By       :
    Systems Tested  :
    PowerShell Ver. :

.USAGE
    Run PowerShell as Administrator.
    PS C:\> .\KA-WN11-00-000175.ps1
#>

$ServiceName = "seclogon"

$Service = Get-Service -Name $ServiceName -ErrorAction SilentlyContinue

if ($Service.Status -eq "Running") {
    Stop-Service -Name $ServiceName -Force
}

Set-Service -Name $ServiceName -StartupType Disabled
