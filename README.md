# Vscode Powershell terminal history per workspace

`vscode_history.ps1` puts workspace histories in `${home}\.vscode_terminal_histories` so histories of different workspaces are not mixed.

Save `vscode_history.ps1` on your PC and remember the path.
Pass it to powershell: `Start-Process pwsh -ArgumentList "-NoExit", "-Command", "& '<path to vscode_history.ps1>'"`
Example: `Start-Process pwsh -ArgumentList "-NoExit", "-Command", "& '${home}/.vscode_terminal_histories/vscode_history.ps1'"`

VS Code Settings example:
```
{        
    "terminal.integrated.profiles.windows": {
	"PowerShell": {
		"path": ["C:\\Program Files\\PowerShell\\7\\pwsh.exe"],
		"args": [
			"-NoExit",
			"-Command",
			"& \"${home}/.vscode_terminal_histories/vscode_history.ps1\""
		],
		"icon": "terminal-powershell"
        },
        "VisualStudio": {
            "source": "PowerShell",
            "path": ["C:\\Program Files\\PowerShell\\7\\pwsh.exe"],
            "args": [
            "-NoExit",
            "-Command",
            "& \"C:/Program Files/Microsoft Visual Studio/18/Professional/Common7/Tools/VsDevCmd.bat\"; & \"${home}/.vscode_terminal_histories/vscode_history.ps1\""
            ],
            "icon": "terminal-powershell"
        },
        "Command Prompt": {
            "path": [
                "${env:windir}\\Sysnative\\cmd.exe",
                "${env:windir}\\System32\\cmd.exe"
            ],
            "args": [],
            "icon": "terminal-cmd"
        },
        "Git Bash": {
            "source": "Git Bash"
		}
	},
    "terminal.integrated.scrollback": 10000
}
```
