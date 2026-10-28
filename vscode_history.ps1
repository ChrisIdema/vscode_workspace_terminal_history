# this script is called by VS Code when initializing powershell integrated terminal
$HistoryBaseDir = "$HOME\.vscode_terminal_histories"

# create destination dir if it doesn't exist
if (!(Test-Path $HistoryBaseDir)) {
    New-Item -ItemType Directory -Path $HistoryBaseDir | Out-Null
}

# create destination filename based on hash of workspace path
$CurrentPath = (Get-Location).Path # current path same as workspace path
$PathHash = [System.Security.Cryptography.SHA256]::Create().ComputeHash([System.Text.Encoding]::UTF8.GetBytes($CurrentPath))
$SafeFileName = [System.BitConverter]::ToString($PathHash).Replace("-", "").Substring(0, 16) + ".txt"

$HistoryFile = Join-Path $HistoryBaseDir $SafeFileName
Set-PSReadLineOption -HistorySavePath $HistoryFile

# message printed at top of terminal for verification
Write-Host "VS Code: History isolated for this folder" -ForegroundColor Cyan
