
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
```powershell
mkdir "$env:USERPROFILE\.bahoot\bin"
Invoke-WebRequest https://raw.githubusercontent.com/superskibidi69/funny-cli/main/bahoot.ps1 -OutFile "$env:USERPROFILE\.bahoot\bin\bahoot.ps1"
echo "@echo off" > "$env:USERPROFILE\.bahoot\bin\bahoot.cmd"
echo "powershell -ExecutionPolicy Bypass -File \"%USERPROFILE%\.bahoot\bin\bahoot.ps1\" %*" >> "$env:USERPROFILE\.bahoot\bin\bahoot.cmd"
setx PATH "%USERPROFILE%\.bahoot\bin;%PATH%"
bahoot banner
bahoot
```

## Windows (CMD)
After installing as above, you can run `bahoot` from CMD. It will auto-detect and use PowerShell for Windows features.

## Updating Bahoot
Once installed, update anytime with:
```shell
bahoot update
```

## Notes
- On Windows, Bahoot uses PowerShell for full compatibility. Bash features are available on Linux/macOS.
- If you want Bash features on Windows, use Git Bash or WSL.
