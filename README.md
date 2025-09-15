
# Bahoot CLI — Cross-Platform Install Guide

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


## Windows (PowerShell)
Open PowerShell and run:
```powershell
mkdir "$env:USERPROFILE\.bahoot\bin"
curl -o "$env:USERPROFILE\.bahoot\bin\bahoot.ps1" https://raw.githubusercontent.com/superskibidi69/funny-cli/main/bahoot.ps1
echo "@echo off" > "$env:USERPROFILE\.bahoot\bin\bahoot.cmd"
echo "powershell -ExecutionPolicy Bypass -File \"%USERPROFILE%\.bahoot\bin\bahoot.ps1\" %*" >> "$env:USERPROFILE\.bahoot\bin\bahoot.cmd"
setx PATH "%USERPROFILE%\.bahoot\bin;%PATH%"
```
Restart your terminal, then run:
```powershell
bahoot banner
bahoot
```


## Windows (CMD)

### Step-by-step CMD Install Instructions

1. Open CMD (not PowerShell).
2. Run the following commands one by one:

```cmd
mkdir "%USERPROFILE%\.bahoot\bin"
curl -o "%USERPROFILE%\.bahoot\bin\bahoot.ps1" https://raw.githubusercontent.com/superskibidi69/funny-cli/main/bahoot.ps1
copy nul "%USERPROFILE%\.bahoot\bin\bahoot.cmd"
echo @echo off > "%USERPROFILE%\.bahoot\bin\bahoot.cmd"
echo powershell -ExecutionPolicy Bypass -File "%%USERPROFILE%%\.bahoot\bin\bahoot.ps1" %%* >> "%USERPROFILE%\.bahoot\bin\bahoot.cmd"
setx PATH "%USERPROFILE%\.bahoot\bin;%PATH%"
REM Restart CMD to reload PATH
```

3. Now you can run Bahoot from CMD:
```cmd
bahoot banner
bahoot
```

### Notes & Troubleshooting
- If curl is not available, download bahoot.ps1 manually from GitHub and place it in the directory above.
- If you see 'bahoot is not recognized', make sure you restarted CMD and PATH is set correctly.
- If you see 'Invoke-WebRequest is not recognized', use `curl` or download manually from GitHub.
- If you see 'The filename, directory name, or volume label syntax is incorrect', check for correct Windows path syntax (use `%USERPROFILE%` not `$env:USERPROFILE`).
- Bahoot requires PowerShell to be installed (Windows 10+ includes it by default).

## Updating Bahoot
Once installed, update anytime with:
```shell
bahoot update
```

## Notes
- On Windows, Bahoot uses PowerShell for full compatibility. Bash features are available on Linux/macOS.
- If you want Bash features on Windows, use Git Bash or WSL.
