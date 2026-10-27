# This script is only called by VS Code
$HistoryBaseDir = "$HOME\.vscode_terminal_histories"

if (!(Test-Path $HistoryBaseDir)) {
    New-Item -ItemType Directory -Path $HistoryBaseDir | Out-Null
}

$CurrentPath = (Get-Location).Path
$PathHash = [System.Security.Cryptography.SHA256]::Create().ComputeHash([System.Text.Encoding]::UTF8.GetBytes($CurrentPath))
$SafeFileName = [System.BitConverter]::ToString($PathHash).Replace("-", "").Substring(0, 16) + ".txt"

$HistoryFile = Join-Path $HistoryBaseDir $SafeFileName
Set-PSReadLineOption -HistorySavePath $HistoryFile

Write-Host "VS Code: History isolated for this folder." -ForegroundColor Cyan
