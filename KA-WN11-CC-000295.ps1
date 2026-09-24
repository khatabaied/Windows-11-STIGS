<#
.SYNOPSIS
    This PowerShell script prevents attachments from being downloaded from RSS feeds.

.NOTES
    Author          : Khatab Aied
    LinkedIn        : N/A
    GitHub          : github.com/khatabaied
    Date Created    : 2026-09-24
    Last Modified   : 2026-09-24
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000295
    Documentation   : https://dl.dod.cyber.mil/wp-content/uploads/stigs/zip/U_MS_Windows_11_V2R9_STIG.zip

.TESTED ON
    Date(s) Tested  :
    Tested By       :
    Systems Tested  :
    PowerShell Ver. :

.USAGE
    Run PowerShell as Administrator.
    PS C:\> .\KA-WN11-CC-000295.ps1
#>

$RegistryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\Feeds"

New-Item -Path $RegistryPath -Force | Out-Null

New-ItemProperty `
    -Path $RegistryPath `
    -Name "DisableEnclosureDownload" `
    -PropertyType DWord `
    -Value 1 `
    -Force | Out-Null
