<#
.SYNOPSIS
    This PowerShell script enables PowerShell Transcription and configures a dedicated transcript output directory.

.NOTES
    Author          : Khatab Aied
    LinkedIn        : N/A
    GitHub          : github.com/khatabaied
    Date Created    : 2026-09-24
    Last Modified   : 2026-09-24
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000327
    Documentation   : https://dl.dod.cyber.mil/wp-content/uploads/stigs/zip/U_MS_Windows_11_V2R9_STIG.zip

.TESTED ON
    Date(s) Tested  :
    Tested By       :
    Systems Tested  :
    PowerShell Ver. :

.USAGE
    Run PowerShell as Administrator.
    PS C:\> .\KA-WN11-CC-000327.ps1
#>

$RegistryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\Transcription"
$TranscriptPath = "C:\ProgramData\PowerShellTranscripts"

New-Item -Path $RegistryPath -Force | Out-Null
New-Item -Path $TranscriptPath -ItemType Directory -Force | Out-Null

New-ItemProperty `
    -Path $RegistryPath `
    -Name "EnableTranscripting" `
    -PropertyType DWord `
    -Value 1 `
    -Force | Out-Null

New-ItemProperty `
    -Path $RegistryPath `
    -Name "OutputDirectory" `
    -PropertyType String `
    -Value $TranscriptPath `
    -Force | Out-Null
