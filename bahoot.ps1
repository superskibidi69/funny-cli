# Use this corrected version that properly escapes the pipes:
$correctedScript = @'
#!/usr/bin/env pwsh

# Terminal colors
$RED = "`e[0;31m"
$GREEN = "`e[0;32m"
$CYAN = "`e[0;36m"
$YELLOW = "`e[1;33m"
$BLUE = "`e[0;34m"
$MAGENTA = "`e[0;35m"
$NC = "`e[0m" # No Color

# Windows detection
function Detect-OS {
    if ($IsWindows) {
        return "Windows"
    } elseif ($IsLinux) {
        return "Linux"
    } elseif ($IsMacOS) {
        return "Mac"
    } else {
        return "Unknown"
    }
}

# Simple spinner loader
function Loader {
    $spin = @('⣷', '⣯', '⣟', '⡿', '⢿', '⣻', '⣽', '⣾')
    Write-Host "Loading " -NoNewline
    $i = 0
    while ($true) {
        Write-Host "`b$($spin[$i % $spin.Length])" -NoNewline
        Start-Sleep -Milliseconds 100
        $i++
    }
}

# Simple rocket animation
function Rocket {
    $rocket = "🚀"
    $gas = "💨"
    $explosion = "💥"
    $maxWidth = [Math]::Min($Host.UI.RawUI.WindowSize.Width - 3, 50)
    
    for ($i = 0; $i -le $maxWidth; $i++) {
        Clear-Host
        $line = ""
        # Draw gas trail
        for ($j = 0; $j -lt $i; $j++) { $line += $gas }
        # Draw rocket
        $line += $rocket
        # Draw spaces
        for ($j = 0; $j -lt ($maxWidth - $i); $j++) { $line += " " }
        # Draw explosion at end
        if ($i -eq $maxWidth) { $line += $explosion }
        
        Write-Host $line -ForegroundColor Yellow
        $speed = 0.18 - ($i / $maxWidth) * 0.13
        Start-Sleep -Seconds $speed
    }
    Write-Host "Rocket launch complete!" -ForegroundColor Green
}

# Diagnostic scanner
function Doctor {
    Write-Host "🔍 Running diagnostics..." -ForegroundColor Green
    Start-Sleep -Milliseconds 500
    
    Write-Host "✅ PowerShell version: $($PSVersionTable.PSVersion)"
    Write-Host "✅ User: $env:USERNAME"
    Write-Host "✅ Host: $env:COMPUTERNAME"
    Write-Host "✅ OS: $(Detect-OS)"
    
    # CPU info
    if ($IsWindows) {
        $cpu = Get-WmiObject -Class Win32_Processor | Select-Object -ExpandProperty Name
        Write-Host "✅ CPU: $cpu"
    } elseif ($IsLinux -or $IsMacOS) {
        try {
            if (Get-Command lscpu -ErrorAction SilentlyContinue) {
                $cpu = (lscpu | Select-String "Model name").ToString().Split(':')[1].Trim()
                Write-Host "✅ CPU: $cpu"
            } elseif (Get-Command sysctl -ErrorAction SilentlyContinue) {
                $cpu = sysctl -n machdep.cpu.brand_string
                Write-Host "✅ CPU: $cpu"
            }
        } catch {}
    }
    
    # Memory info
    if ($IsWindows) {
        $mem = Get-WmiObject -Class Win32_OperatingSystem
        $totalMem = [math]::Round($mem.TotalVisibleMemorySize / 1MB, 2)
        $freeMem = [math]::Round($mem.FreePhysicalMemory / 1MB, 2)
        Write-Host "✅ Memory: ${freeMem}GB/${totalMem}GB used"
    } elseif (Get-Command free -ErrorAction SilentlyContinue) {
        $mem = free -h | Select-String "Mem:"
        Write-Host "✅ Memory: $($mem -replace 'Mem:\s+')"
    }
}

# Fake meltdown
function Prank {
    $errors = @(
        "KERNEL_SECURITY_CHECK_FAILURE",
        "CRITICAL_PROCESS_DIED", 
        "SYSTEM_THREAD_EXCEPTION_NOT_HANDLED",
        "IRQL_NOT_LESS_OR_EQUAL",
        "PAGE_FAULT_IN_NONPAGED_AREA",
        "DRIVER_IRQL_NOT_LESS_OR_EQUAL",
        "KMODE_EXCEPTION_NOT_HANDLED"
    )
    
    for ($i = 1; $i -le 5; $i++) {
        Write-Host "💥 SYSTEM FAILURE DETECTED" -ForegroundColor Red
        Start-Sleep -Milliseconds 200
        Write-Host "Dumping memory..." -ForegroundColor Yellow
        Start-Sleep -Milliseconds 300
        Write-Host "$(Get-Random $errors)" -ForegroundColor Red
        Start-Sleep -Milliseconds 300
        Clear-Host
    }
    Write-Host "Memory dumped." -ForegroundColor Red
    Start-Sleep -Seconds 1
    Write-Host "Just kidding 😎" -ForegroundColor Green
}

# Chaos mode
function Chaos {
    Write-Host "🧨 Entering chaos mode..." -ForegroundColor Cyan
    Start-Sleep -Seconds 0.5
    
    $errors = @(
        "KERNEL_SECURITY_CHECK_FAILURE", "CRITICAL_PROCESS_DIED", 
        "SYSTEM_THREAD_EXCEPTION_NOT_HANDLED", "IRQL_NOT_LESS_OR_EQUAL",
        "PAGE_FAULT_IN_NONPAGED_AREA", "DRIVER_IRQL_NOT_LESS_OR_EQUAL",
        "KMODE_EXCEPTION_NOT_HANDLED", "SANITY_NOT_FOUND",
        "BAHOOT_OVERFLOW", "TERMINAL_TOO_COOL"
    )
    
    for ($i = 1; $i -le 30; $i++) {
        $color = 31 + ($i % 6)
        Write-Host "`e[1;${color}mERROR ${i}: $(Get-Random $errors)$NC"
        
        if ((Get-Random 5) -eq 0) {
            [System.Console]::Beep()
            Clear-Host
            Start-Sleep -Milliseconds 100
        }
        Start-Sleep -Milliseconds 70
    }
    
    for ($i = 1; $i -le 10; $i++) {
        Write-Host "`e[1;33mCHAOS LEVEL: $(Get-Random 100)%$NC"
        Start-Sleep -Milliseconds 50
    }
    Write-Host "💫 Chaos complete." -ForegroundColor Cyan
}

# Banner - FIXED: Replaced pipe characters with alternatives
function Banner {
    $lines = @(
        " ______  _______ _     _  _____   _____  _______",
        " |_____] |_____| |_____| |     | |     |    |   ",
        " |_____] |     | |     | |_____| |_____|    |   "
    )
    
    Clear-Host
    foreach ($line in $lines) {
        # Replace pipes with vertical bars for PowerShell compatibility
        $line = $line -replace '\|', '∣'
        foreach ($char in $line.ToCharArray()) {
            Write-Host $char -ForegroundColor Cyan -NoNewline
            Start-Sleep -Milliseconds 10
        }
        Write-Host ""
        Start-Sleep -Milliseconds 150
    }
}

# Update function
function Update {
    Write-Host "🔄 Updating Bahoot CLI..." -ForegroundColor Cyan
    
    $backupFile = "$PSCommandPath.bak"
    Copy-Item $PSCommandPath $backupFile
    
    try {
        Invoke-WebRequest -Uri "https://raw.githubusercontent.com/superskibidi69/funny-cli/main/bahoot.ps1" -OutFile "$PSCommandPath.tmp"
        
        $oldHash = Get-FileHash $PSCommandPath -Algorithm MD5 | Select-Object -ExpandProperty Hash
        $newHash = Get-FileHash "$PSCommandPath.tmp" -Algorithm MD5 | Select-Object -ExpandProperty Hash
        
        if ($oldHash -ne $newHash) {
            Move-Item "$PSCommandPath.tmp" $PSCommandPath -Force
            Write-Host "✅ Update complete!" -ForegroundColor Green
        } else {
            Remove-Item "$PSCommandPath.tmp"
            Write-Host "ℹ️ Already up to date." -ForegroundColor Yellow
        }
        Remove-Item $backupFile -ErrorAction SilentlyContinue
    } catch {
        Write-Host "❌ Update failed. Restoring backup." -ForegroundColor Red
        Move-Item $backupFile $PSCommandPath -Force
    }
}

# Uninstall
function Uninstall {
    Write-Host "💣 Uninstall sequence initiated..." -ForegroundColor Red
    for ($i = 5; $i -ge 1; $i--) {
        Write-Host "$i..." -ForegroundColor Red
        Start-Sleep -Seconds 1
    }
    Write-Host "Deleting Bahoot CLI from: $PSCommandPath"
    Remove-Item $PSCommandPath -Force
    Write-Host "💥 BOOM!" -ForegroundColor Red
}

# Troll mode
function Troll {
    $messages = @(
        "Installing virus...",
        "Formatting disk...",
        "Sending your IP to Bahoot HQ...",
        "Just kidding 😎"
    )
    
    foreach ($msg in $messages) {
        Write-Host $msg -ForegroundColor Red
        Start-Sleep -Milliseconds (100 + (Get-Random 500))
    }
}

# Party mode
function Party {
    Write-Host "🎉 Welcome to Bahoot Party Mode!" -ForegroundColor Yellow
    
    $fireworks = @(
        "          .     .",
        "         / \   / \",
        "    .---'     '     '---.",
        "   /                     \",
        "  (      B A H O O T      )",
        "   \                     /",
        "    ''--.         .--''",
        "         '-------'"
    )
    
    for ($i = 1; $i -le 3; $i++) {
        Clear-Host
        $color = 31 + (Get-Random 6)
        $firework = $fireworks[(Get-Random $fireworks.Length)]
        Write-Host "`e[1;${color}m$firework$NC"
        Write-Host "`e[1;${color}m🎊 🎈 🎉 Bahoot rocks! 🎉 🎈 🎊$NC"
        Start-Sleep -Milliseconds 300
    }
    Write-Host "🎵 Party's over, back to work!" -ForegroundColor Green
}

# Scan function
function Scan {
    Write-Host "🦠 Scanning system for viruses..." -ForegroundColor Red
    
    for ($i = 1; $i -le 20; $i++) {
        $percent = $i * 5
        $bar = "█" * $i + "░" * (20 - $i)
        Write-Host "`r[$bar] ${percent}%" -NoNewline
        Start-Sleep -Milliseconds 200
    }
    Write-Host "`n"
    
    Start-Sleep -Seconds 1
    Write-Host "Found: 3 threats"
    Start-Sleep -Seconds 1
    Write-Host "Threat 1: Bahoot overload"
    Write-Host "Threat 2: Excessive swag"
    Write-Host "Threat 3: Terminal too cool"
    Write-Host "✅ All threats neutralized." -ForegroundColor Green
}

# Boot sequence
function Boot {
    Write-Host "🖥️ Booting Bahoot OS..." -ForegroundColor Cyan
    Start-Sleep -Seconds 0.5
    
    $bootMessages = @(
        "Initializing kernel.............[ OK ]",
        "Loading modules.................[ OK ]",
        "Mounting /bahoot................[ OK ]",
        "Checking system integrity.......[ OK ]",
        "Starting services...............[ OK ]"
    )
    
    foreach ($msg in $bootMessages) {
        Write-Host $msg -ForegroundColor Green
        Start-Sleep -Seconds 0.5
    }
    
    Write-Host "Welcome to Bahoot OS 🤖"
}

# Hack function
function Hack {
    Write-Host "💻 Hacking in progress..." -ForegroundColor Green
    for ($i = 1; $i -le 20; $i++) {
        $ip = "$(Get-Random 255).$(Get-Random 255).$(Get-Random 255).$(Get-Random 255)"
        Write-Host "Accessing $ip... success"
        Start-Sleep -Milliseconds 100
    }
    Write-Host "🔥 Firewall breached. Just kidding." -ForegroundColor Red
}

# Glitch effect
function Glitch {
    $chars = "█▓▒░@#$%^&*()[]{}<>~ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".ToCharArray()
    
    for ($i = 1; $i -le 15; $i++) {
        Clear-Host
        for ($j = 1; $j -le 8; $j++) {
            $len = 10 + (Get-Random 50)
            $str = -join ($chars | Get-Random -Count $len)
            $color = 31 + (Get-Random 7)
            
            if ((Get-Random 4) -eq 0) {
                Write-Host "`e[7;${color}m$str$NC"
            } else {
                Write-Host "`e[1;${color}m$str$NC"
            }
        }
        Start-Sleep -Milliseconds 70
    }
    Write-Host "System stabilized." -ForegroundColor Green
}

# Fortune function
function Fortune {
    $quotes = @(
        "You will write bug-free code today.",
        "Bahoot believes in you.",
        "Your terminal is your canvas.",
        "Don't forget to hydrate."
    )
    
    $colors = @($GREEN, $CYAN, $YELLOW, $BLUE, $MAGENTA)
    $fortuneText = Get-Random $quotes
    $color = Get-Random $colors
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    
    Write-Host "${color}🍀 Fortune [${timestamp}]:$NC $fortuneText"
}

# Echo function
function Echo-Cmd {
    $text = $args -join " "
    Write-Host "${CYAN}🔊 YOU SAID:$NC $($text.ToUpper())"
}

# Clear function
function Clear-Cmd {
    $rows = $Host.UI.RawUI.WindowSize.Height
    $cols = $Host.UI.RawUI.WindowSize.Width
    
    for ($i = 0; $i -lt $rows; $i++) {
        Write-Host (" " * $cols)
        Start-Sleep -Milliseconds 20
    }
    Clear-Host
    Write-Host "🧼 Screen cleared." -ForegroundColor Green
}

# Credits function
function Credits {
    $creditsText = @(
        "BAHOOT CLI CREDITS",
        "==================",
        "",
        "Created by: superfood",
        "Inspired by: chaos and shell magic",
        "",
        "Special thanks to:",
        "• The terminal enthusiasts",
        "• The open source community",
        "• Everyone who loves fun CLI tools",
        "",
        "Remember: Your terminal is your canvas!",
        "",
        "THE END"
    )
    
    Clear-Host
    foreach ($line in $creditsText) {
        Write-Host $line -ForegroundColor Cyan
        Start-Sleep -Milliseconds 200
    }
}

# Help menu
function Help-Menu {
    Write-Host "Bahoot CLI 🤖 — Available commands:" -ForegroundColor Cyan
    Write-Host "  prank       Fake system meltdown"
    Write-Host "  deploy      Launch ASCII rocket"
    Write-Host "  chaos       Print colorful chaos errors"
    Write-Host "  doctor      Show system diagnostics"
    Write-Host "  banner      Animated Bahoot ASCII logo"
    Write-Host "  update      Update Bahoot CLI from GitHub"
    Write-Host "  uninstall   Dramatically delete Bahoot CLI"
    Write-Host "  troll       Print fake errors and warnings"
    Write-Host "  party       Celebrate with confetti"
    Write-Host "  scan        Fake virus scan"
    Write-Host "  boot        Simulate Bahoot OS boot sequence"
    Write-Host "  hack        Fake hacking animation"
    Write-Host "  glitch      Terminal glitch effect"
    Write-Host "  fortune     Get a random fortune/quote"
    Write-Host "  echo [text] Repeat your input with flair"
    Write-Host "  clear       Clear the screen"
    Write-Host "  credits     Show Bahoot CLI credits"
    Write-Host "  help        Show this help menu"
}

# Main command handler
$command = $args[0]

switch ($command) {
    "prank" { Prank }
    "deploy" { Rocket }
    "chaos" { Chaos }
    "doctor" { Doctor }
    "banner" { Banner }
    "update" { Update }
    "uninstall" { Uninstall }
    "troll" { Troll }
    "party" { Party }
    "scan" { Scan }
    "boot" { Boot }
    "hack" { Hack }
    "glitch" { Glitch }
    "fortune" { Fortune }
    "echo" { if ($args[1]) { Echo-Cmd @($args[1..($args.Length-1)]) } else { Write-Host "Usage: bahoot echo [text]" } }
    "clear" { Clear-Cmd }
    "credits" { Credits }
    "help" { Help-Menu }
    default { Help-Menu }
}
'@

# Save and execute the corrected script
$correctedScript | Out-File -FilePath "$env:TEMP\bahoot_fixed.ps1" -Encoding UTF8
& "$env:TEMP\bahoot_fixed.ps1" help
'@

Invoke-Expression $correctedScript