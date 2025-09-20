
# Bahoot CLI —  Install Guide

## Linux/macOS (Bash/Zsh)
```bash
mkdir -p ~/.bahoot/bin && \
curl -fsSL https://raw.githubusercontent.com/superskibidi69/funny-cli/main/bahoot -o ~/.bahoot/bin/bahoot && \
chmod +x ~/.bahoot/bin/bahoot && \
echo 'export PATH="$HOME/.bahoot/bin:$PATH"' >> ~/.bashrc && \
source ~/.bashrc && \
bahoot banner && bahoot
```

For Zsh, replace `.bashrc` with `.zshrc`.
Now you can run:
```shell
bahoot banner
bahoot
```

### Notes & Troubleshooting
~~- CLI is not supported on windows (yet).~~
---
beta version of powershell, may not work:
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
mkdir ~/.bahoot/bin -Force
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/superskibidi69/funny-cli/main/bahoot.ps1" -OutFile ~/.bahoot/bin/bahoot.ps1
$profileDir = Split-Path $PROFILE -Parent
if (!(Test-Path $profileDir)) {
    mkdir $profileDir -Force
}
Add-Content -Path $PROFILE -Value @"
# Bahoot CLI
`$env:PATH = "`$HOME\.bahoot\bin;`$env:PATH"
function bahoot { & "`$HOME\.bahoot\bin\bahoot.ps1" @args }
"@
. $PROFILE
bahoot banner
```
## Updating Bahoot CLI
Once installed, update anytime with:
```shell
bahoot update
```
