to install on bash:
```bash
mkdir -p ~/.bahoot/bin && curl -fsSL https://raw.githubusercontent.com/superskibidi69/funny-cli/main/bahoot -o ~/.bahoot/bin/bahoot && chmod +x ~/.bahoot/bin/bahoot && echo 'export PATH="$HOME/.bahoot/bin:$PATH"' >> ~/.bashrc && source ~/.bashrc && bahoot
```

on zsh:
```shell
mkdir -p ~/.bahoot/bin && curl -fsSL https://raw.githubusercontent.com/superskibidi69/funny-cli/main/bahoot -o ~/.bahoot/bin/bahoot && chmod +x ~/.bahoot/bin/bahoot && echo 'export PATH="$HOME/.bahoot/bin:$PATH"' >> ~/.zshrc && source ~/.zshrc && bahoot
```
on powershell:
```shell
irm https://raw.githubusercontent.com/superskibidi69/funny-cli/main/bahoot | %{ni "$env:USERPROFILE\.bahoot\bin" -f}; sc "$env:USERPROFILE\.bahoot\bin\bahoot" $_; icm {echo '@echo off' > "$env:USERPROFILE\.bahoot\bin\bahoot.cmd"; echo bash `"$env:USERPROFILE\.bahoot\bin\bahoot`" %%* >> "$env:USERPROFILE\.bahoot\bin\bahoot.cmd"}; $p=[Environment]::GetEnvironmentVariable("Path","User"); if(!$p.Contains("$env:USERPROFILE\.bahoot\bin")){[Environment]::SetEnvironmentVariable("Path","$p;$env:USERPROFILE\.bahoot\bin","User")}; bahoot
```

on cmd prompt: (for skiddies who only know cmd prompt)
```shell
mkdir "%USERPROFILE%\.bahoot\bin" && curl -fsSL https://raw.githubusercontent.com/superskibidi69/funny-cli/main/bahoot -o "%USERPROFILE%\.bahoot\bin\bahoot" && echo @echo off > "%USERPROFILE%\.bahoot\bin\bahoot.cmd" && echo bash "%USERPROFILE%\.bahoot\bin\bahoot" %%* >> "%USERPROFILE%\.bahoot\bin\bahoot.cmd" && setx PATH "%USERPROFILE%\.bahoot\bin;%PATH%" && bahoot
```
once you have installed, as long as you do not uninstall the CLI, just run 
```shell
bahoot update
```
