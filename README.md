
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
- CLI is not supported on windows (yet).
---
## Updating Bahoot CLI
Once installed, update anytime with:
```shell
bahoot update
```
