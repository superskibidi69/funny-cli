#!/usr/bin/env pwsh

# Colors
$RED="`e[0;31m";$GREEN="`e[0;32m";$CYAN="`e[0;36m";$YELLOW="`e[1;33m";$BLUE="`e[0;34m";$MAGENTA="`e[0;35m";$NC="`e[0m"

# OS detection
function Detect-OS{
    if($IsWindows){return "Windows"}
    elseif($IsLinux){return "Linux"}
    elseif($IsMacOS){return "Mac"}
    else{return "Unknown"}
}

# Banner
function Banner{
    $lines=@(
        ' ______  _______ _     _  _____   _____  _______',
        ' |_____] |_____| |_____| |     | |     |    |   ',
        ' |_____] |     | |     | |_____| |_____|    |   '
    )
    Clear-Host
    foreach($l in $lines){
        foreach($c in $l.ToCharArray()){Write-Host $c -ForegroundColor Cyan -NoNewline; Start-Sleep -Milliseconds 10}
        Write-Host ""; Start-Sleep -Milliseconds 150
    }
}

# Rocket / Deploy
function Rocket{
    $r="🚀";$g="💨";$e="💥";$max=[Math]::Min($Host.UI.RawUI.WindowSize.Width-3,50)
    for($i=0;$i -le $max;$i++){
        Clear-Host;$line="";for($j=0;$j -lt $i;$j++){$line+=$g};$line+=$r;for($j=0;$j -lt ($max-$i);$j++){$line+=""}
        if($i -eq $max){$line+=$e};Write-Host $line -ForegroundColor Yellow
        Start-Sleep -Seconds (0.18-($i/$max)*0.13)
    }
    Write-Host "Rocket launch complete!" -ForegroundColor Green
}

# Prank
function Prank{
    $errs=@("KERNEL_SECURITY_CHECK_FAILURE","CRITICAL_PROCESS_DIED","SYSTEM_THREAD_EXCEPTION_NOT_HANDLED","IRQL_NOT_LESS_OR_EQUAL","PAGE_FAULT_IN_NONPaged_AREA","DRIVER_IRQL_NOT_LESS_OR_EQUAL","KMODE_EXCEPTION_NOT_HANDLED")
    for($i=1;$i -le 5;$i++){
        Write-Host "💥 SYSTEM FAILURE DETECTED" -ForegroundColor Red
        Start-Sleep -Milliseconds 200
        Write-Host "Dumping memory..." -ForegroundColor Yellow
        Start-Sleep -Milliseconds 300
        Write-Host $(Get-Random $errs) -ForegroundColor Red
        Start-Sleep -Milliseconds 300
        Clear-Host
    }
    Write-Host "Memory dumped." -ForegroundColor Red; Start-Sleep 1
    Write-Host "Just kidding 😎" -ForegroundColor Green
}

# Chaos
function Chaos{
    $errs=@("KERNEL_SECURITY_CHECK_FAILURE","CRITICAL_PROCESS_DIED","SYSTEM_THREAD_EXCEPTION_NOT_HANDLED","IRQL_NOT_LESS_OR_EQUAL","PAGE_FAULT_IN_NONPaged_AREA","DRIVER_IRQL_NOT_LESS_OR_EQUAL","KMODE_EXCEPTION_NOT_HANDLED","SANITY_NOT_FOUND","BAHOOT_OVERFLOW","TERMINAL_TOO_COOL")
    for($i=1;$i -le 30;$i++){
        $c=31+($i%6)
        Write-Host "`e[1;${c}mERROR $i: $(Get-Random $errs)$NC"
        if((Get-Random 5)-eq 0){[System.Console]::Beep();Clear-Host;Start-Sleep -Milliseconds 100}
        Start-Sleep -Milliseconds 70
    }
    for($i=1;$i -le 10;$i++){Write-Host "`e[1;33mCHAOS LEVEL: $(Get-Random 100)%$NC";Start-Sleep -Milliseconds 50}
    Write-Host "💫 Chaos complete." -ForegroundColor Cyan
}

# Doctor
function Doctor{
    Write-Host "🔍 Running diagnostics..." -ForegroundColor Green; Start-Sleep 0.5
    Write-Host "✅ PowerShell version: $($PSVersionTable.PSVersion)"
    Write-Host "✅ User: $env:USERNAME"; Write-Host "✅ Host: $env:COMPUTERNAME"; Write-Host "✅ OS: $(Detect-OS)"
}

# Update
function Update{
    Write-Host "🔄 Updating Bahoot CLI..." -ForegroundColor Cyan
    $b="$PSCommandPath.bak";Copy-Item $PSCommandPath $b
    try{
        Invoke-WebRequest "https://raw.githubusercontent.com/superskibidi69/funny-cli/main/bahoot.ps1" -OutFile "$PSCommandPath.tmp"
        $o=(Get-FileHash $PSCommandPath -Algorithm MD5).Hash;$n=(Get-FileHash "$PSCommandPath.tmp" -Algorithm MD5).Hash
        if($o -ne $n){Move-Item "$PSCommandPath.tmp" $PSCommandPath -Force;Write-Host "✅ Update complete!" -ForegroundColor Green}
        else{Remove-Item "$PSCommandPath.tmp";Write-Host "ℹ️ Already up to date." -ForegroundColor Yellow}
        Remove-Item $b -ErrorAction SilentlyContinue
    } catch{Write-Host "❌ Update failed. Restoring backup." -ForegroundColor Red;Move-Item $b $PSCommandPath -Force}
}

# Uninstall
function Uninstall{
    Write-Host "💣 Uninstalling..." -ForegroundColor Red
    for($i=5;$i -ge 1;$i--){Write-Host "$i..." -ForegroundColor Red;Start-Sleep 1}
    Remove-Item $PSCommandPath -Force
    Write-Host "💥 BOOM!" -ForegroundColor Red
}

# Party
function Party{
    Write-Host "🎉 Welcome to Bahoot Party Mode!" -ForegroundColor Yellow
    $fw=@(" . ."," / \ / \"," .---'     '---.","/             \","( B A H O O T )","\             /","''--.     .--''"," '-------'")
    for($i=1;$i -le 3;$i++){
        Clear-Host
        $color=31+Get-Random 6
        $f=$fw[Get-Random $fw.Length]
        Write-Host "`e[1;${color}m$f$NC"
        Write-Host "`e[1;${color}m🎊 🎈 🎉 Bahoot rocks! 🎉 🎈 🎊$NC"
        Start-Sleep 0.3
    }
    Write-Host "🎵 Party's over, back to work!" -ForegroundColor Green
}

# Troll
function Troll{
    $msgs=@("Installing virus...","Formatting disk...","Sending your IP to Bahoot HQ...","Just kidding 😎")
    foreach($m in $msgs){Write-Host $m -ForegroundColor Red;Start-Sleep -Milliseconds (100+Get-Random 500)}
}

# Glitch
function Glitch{
    $chars="█▓▒░@#$%^&*()[]{}<>~ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".ToCharArray()
    for($i=1;$i -le 15;$i++){
        Clear-Host
        for($j=1;$j -le 8;$j++){
            $len=10+Get-Random 50;$s=-join ($chars | Get-Random -Count $len);$c=31+Get-Random 7
            if((Get-Random 4)-eq 0){Write-Host "`e[7;${c}m$s$NC"} else {Write-Host "`e[1;${c}m$s$NC"}
        }
        Start-Sleep 0.07
    }
    Write-Host "System stabilized." -ForegroundColor Green
}

# Hack
function Hack{
    Write-Host "💻 Hacking in progress..." -ForegroundColor Green
    for($i=1;$i -le 20;$i++){
        $ip="$(Get-Random 255).$(Get-Random 255).$(Get-Random 255).$(Get-Random 255)"
        Write-Host "Accessing $ip... success";Start-Sleep -Milliseconds 100
    }
    Write-Host "🔥 Firewall breached. Just kidding." -ForegroundColor Red
}

# Fortune
function Fortune{
    $quotes=@("You will write bug-free code today.","Bahoot believes in you.","Your terminal is your canvas.","Don't forget to hydrate.")
    $colors=@($GREEN,$CYAN,$YELLOW,$BLUE,$MAGENTA)
    $txt=Get-Random $quotes;$c=Get-Random $colors;$t=Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Write-Host "${c}🍀 Fortune [$t]:$NC $txt"
}

# Echo
function Echo-Cmd{
    $txt=$args -join " "
    Write-Host "${CYAN}🔊 YOU SAID:$NC $($txt.ToUpper())"
}

# Clear
function Clear-Cmd{
    $rows=$Host.UI.RawUI.WindowSize.Height;$cols=$Host.UI.RawUI.WindowSize.Width
    for($i=0;$i -lt $rows;$i++){Write-Host (" "*$cols);Start-Sleep -Milliseconds 20}
    Clear-Host;Write-Host "🧼 Screen cleared." -ForegroundColor Green
}

# Credits
function Credits{
    $txt=@("BAHOOT CLI CREDITS","==================","","Created by: superfood","Inspired by: chaos and shell magic","","Special thanks to:","• The terminal enthusiasts","• The open source community","• Everyone who loves fun CLI tools","","Remember: Your terminal is your canvas!","","THE END")
    Clear-Host
    foreach($l in $txt){Write-Host $l -ForegroundColor Cyan;Start-Sleep -Milliseconds 200}
}

# Scan
function Scan{
    Write-Host "🦠 Scanning system for viruses..." -ForegroundColor Red
    for($i=1;$i -le 20;$i++){
        $p=$i*5;$bar="█"* $i +"░"*(20-$i)
        Write-Host "`r[$bar] $p%" -NoNewline;Start-Sleep 0.2
    }
    Write-Host "`nFound: 3 threats";Start-Sleep 1
    Write-Host "Threat 1: Bahoot overload";Write-Host "Threat 2: Excessive swag";Write-Host "Threat 3: Terminal too cool"
    Write-Host "✅ All threats neutralized." -ForegroundColor Green
}

# Boot
function Boot{
    Write-Host "🖥️ Booting Bahoot OS..." -ForegroundColor Cyan;Start-Sleep 0.5
    $msgs=@("Initializing kernel.............[ OK ]","Loading modules.................[ OK ]","Mounting /bahoot................[ OK ]","Checking system integrity.......[ OK ]","Starting services...............[ OK ]")
    foreach($m in $msgs){Write-Host $m -ForegroundColor Green;Start-Sleep 0.5}
    Write-Host "Welcome to Bahoot OS 🤖"
}

# Help
function Help-Menu{
    Write-Host "Bahoot CLI 🤖 — commands:" -ForegroundColor Cyan
    "prank deploy chaos doctor banner update uninstall party troll glitch hack fortune echo clear credits scan boot help" | ForEach-Object {Write-Host "  $_"}
}

# Main
$cmd=$args[0]
switch($cmd){
    "prank"{Prank}
    "deploy"{Rocket}
    "chaos"{Chaos}
    "doctor"{Doctor}
    "banner"{Banner}
    "update"{Update}
    "uninstall"{Uninstall}
    "party"{Party}
    "troll"{Troll}
    "glitch"{Glitch}
    "hack"{Hack}
    "fortune"{Fortune}
    "echo"{if($args[1]){Echo-Cmd @($args[1..($args.Length-1)])}else{Write-Host "Usage: bahoot echo [text]"}}
    "clear"{Clear-Cmd}
    "credits"{Credits}
    "scan"{Scan}
    "boot"{Boot}
    "help"{Help-Menu}
    default{Help-Menu}
}