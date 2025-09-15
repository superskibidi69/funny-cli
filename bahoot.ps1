# Bahoot PowerShell — Full Feature Port
param(

# Parse arguments for CMD compatibility
if ($args.Count -eq 0) {
    $Command = "help"
    $Args = @()
} else {
    $Command = $args[0]
    if ($args.Count -gt 1) {
        $Args = $args[1..($args.Count-1)]
    } else {
        $Args = @()
    }
}

# Helper: Write colored text
function Write-Colored($Text, $Color) {
    Write-Host $Text -ForegroundColor $Color
}

# Loader animation
function Loader {
    Write-Host -NoNewline "Loading"
    for ($i=0; $i -lt 5; $i++) {
        Write-Host -NoNewline "."
        Start-Sleep -Milliseconds 200
    }
    Write-Host
}

# Banner
function Banner {
    $lines = @(
        " ______  _______ _     _  _____   _____  _______",
        " |_____] |_____| |_____| |     | |     |    |   ",
        " |_____] |     | |     | |_____| |_____|    |   "
    )
    Clear-Host
    foreach ($line in $lines) {
        foreach ($char in $line.ToCharArray()) {
            Write-Host -NoNewline $char -ForegroundColor Cyan
            Start-Sleep -Milliseconds 10
        }
        Write-Host
        Start-Sleep -Milliseconds 150
    }
}

# Rocket launch
function Rocket {
    $cols = $Host.UI.RawUI.WindowSize.Width
    $rocket = "🚀"
    $gas = "💨"
    $explosion = "💥"
    $rocket_len = 2
    $max_pos = $cols - $rocket_len - 1
    for ($i=0; $i -le $max_pos; $i++) {
        Clear-Host
        $line = ""
        # Draw spaces before rocket
        for ($j=0; $j -lt $i; $j++) { $line += " " }
        # Draw rocket
        $line += $rocket
        # Draw gas trail behind rocket
        for ($j=0; $j -lt $i; $j++) { $line += $gas }
        # Draw explosion at end
        if ($i -eq $max_pos) { $line += $explosion }
        Write-Host $line -ForegroundColor Yellow
        $speed = [int](180 - ($i/$max_pos)*130)
        Start-Sleep -Milliseconds $speed
    }
    Write-Colored "Rocket launch complete!" "Green"
}

# Doctor diagnostics
function Doctor {
    Write-Colored "🔍 Running diagnostics..." "Green"
    Start-Sleep -Milliseconds 500
    Write-Host "✅ PowerShell version: $($PSVersionTable.PSVersion)"
    Write-Host "✅ Terminal: $($env:TERM)"
    Write-Host "✅ User: $env:USERNAME"
    Write-Host "✅ Host: $env:COMPUTERNAME"
    Write-Host "✅ Uptime: $(Get-Uptime)"
}

# Prank
function Prank {
    Loader
    for ($i=0; $i -lt 5; $i++) {
        Write-Colored "💥 SYSTEM FAILURE DETECTED" "Red"
        Start-Sleep -Milliseconds 200
        Write-Colored " Dumping memory..." "Yellow"
        Start-Sleep -Milliseconds 300
        Write-Colored " Kernel panic: unexpected token 'bahoot'" "Red"
        Start-Sleep -Milliseconds 300
        Clear-Host
    }
    Write-Colored " Memory dumped." "Red"
    Start-Sleep -Seconds 1
    Write-Colored "Just kidding 😎" "Green"
}

# Chaos mode
function Chaos {
    Write-Colored "🧨 Entering chaos mode..." "Cyan"
    Start-Sleep -Milliseconds 500
    for ($i=1; $i -le 20; $i++) {
        $color = @("Red","Green","Yellow","Cyan","Magenta","Blue")[$i % 6]
        Write-Host "ERROR $i: sanity not found" -ForegroundColor $color
        Start-Sleep -Milliseconds 70
    }
    for ($i=1; $i -le 10; $i++) {
        Write-Host "CHAOS LEVEL: $([math]::Round((Get-Random)*100))%" -ForegroundColor Yellow
        Start-Sleep -Milliseconds 50
    }
    Write-Colored "💫 Chaos complete." "Cyan"
}

# Matrix mode
function Matrix {
    Write-Colored "🧪 Entering matrix mode..." "Green"
    $cols = 80
    $rows = 24
    $chars = @("a".."z" + "A".."Z" + "0".."9")
    $pos = @(foreach ($i in 0..($cols-1)) { Get-Random -Minimum 1 -Maximum $rows })
    $len = @(foreach ($i in 0..($cols-1)) { Get-Random -Minimum 3 -Maximum ($rows/2) })
    for ($frame=0; $frame -lt 100; $frame++) {
        Clear-Host
        for ($i=0; $i -lt $cols; $i+=4) {
            for ($j=0; $j -lt $len[$i]; $j++) {
                $y = $pos[$i] - $j
                if ($y -gt 0 -and $y -le $rows) {
                    $char = $chars | Get-Random
                    if ($j -eq 0) {
                        Write-Host "$char" -NoNewline -ForegroundColor White
                    } elseif ($j -lt ($len[$i]/2)) {
                        Write-Host "$char" -NoNewline -ForegroundColor Green
                    } else {
                        Write-Host "$char" -NoNewline -ForegroundColor DarkGreen
                    }
                }
            }
        }
        for ($i=0; $i -lt $cols; $i++) {
            $pos[$i]++
            if ($pos[$i] - $len[$i] -gt $rows) {
                $pos[$i] = 1
                $len[$i] = Get-Random -Minimum 3 -Maximum ($rows/2)
            }
        }
        Start-Sleep -Milliseconds 50
    }
    Write-Colored "\n🧠 Matrix exited." "Green"
}

# Party mode
function Party {
    Write-Colored "🎉 Welcome to Bahoot Party Mode!" "Yellow"
    for ($i=0; $i -lt 10; $i++) {
        Write-Host "🎊 🎈 🎉 Bahoot rocks! 🎉 🎈 🎊" -ForegroundColor Magenta
        Start-Sleep -Milliseconds 150
    }
    Write-Colored "🎵 Party's over, back to work!" "Green"
}

# Fortune
function Fortune {
    $quotes = @(
        "You will write bug-free code today.",
        "Bahoot believes in you.",
        "Your terminal is your canvas.",
        "Don't forget to hydrate."
    )
    $quote = Get-Random -InputObject $quotes
    Write-Colored "🍀 Fortune: $quote" "Green"
}

# Credits
function Credits {
    Write-Colored "📜 Bahoot CLI was built by superfood." "Cyan"
    Write-Host "Inspired by chaos, crafted with shell magic."
}

# Duck spam
function Duck {
    Write-Colored "Quack! Quack! Quack!" "Yellow"
    $frames = @(
        "       __\n      (o >\n   \\_\\_\\)#_)\n~~~~~~~~~~~~~~~~~~~~~~~~",
        "       __\n      (o<\n   \\_\\_\\)#_)\n~~~~~~~~~~~~~~~~~~~~~~~~",
        "       __\n      (o >\n   \\_\\_\\)#_)  *splash*\n~~~~~~~~~~~~~~~~~~~~~~~~",
        "       __\n      (^ >\n   \\_\\_\\)#_)\n~~~~~~~~~~~~~~~~~~~~~~~~"
    )
    $positions = @(5,10,15,20,25,30,20,15,10,5)
    for ($cycle=0; $cycle -lt 2; $cycle++) {
        foreach ($pos in $positions) {
            Clear-Host
            Write-Host (" " * $pos) -NoNewline
            Write-Colored $frames[$cycle % 4] "Yellow"
            Write-Colored "\nQuack! Swimming around the pond!" "Green"
            Start-Sleep -Milliseconds 300
        }
    }
    Write-Colored "All ducks have swum away." "Green"
}

# Crab rave
function Crab {
    Write-Colored "🦀 Crab rave started!" "Cyan"
    $frames = @(
        "   \\o/  \\o/\n    |    |\n  _/ \\__/ \\_\n {.  \\_/  .}\n  \\._    _./\n     |  |\n    /    \\",
        "   \\o|  |o/\n    |    |\n  _/ \\__/ \\_\n {.  \\_/  .}\n  \\._    _./\n     |  |\n    /    \\",
        "   /o\\  /o\\\n    |    |\n  _/ \\__/ \\_\n {.  \\_/  .}\n  \\._    _./\n     |  |\n    /    \\",
        "   |o/  \\o|\n    |    |\n  _/ \\__/ \\_\n {.  \\_/  .}\n  \\._    _./\n     |  |\n    /    \\" 
    )
    $positions = @(2,8,15,22,28,35,28,22,15,8,2)
    for ($cycle=0; $cycle -lt 2; $cycle++) {
        foreach ($pos in $positions) {
            Clear-Host
            Write-Host (" " * $pos) -NoNewline
            Write-Colored $frames[$cycle % 4] "Red"
            Write-Colored "\n🎵 Crab rave! Moving sideways! 🎵" "Yellow"
            Start-Sleep -Milliseconds 400
        }
    }
    Write-Colored "Crab rave ended." "Green"
}

# Frog rain
function Frog {
    Write-Colored "� Frog rain incoming..." "Green"
    for ($i=0; $i -lt 20; $i++) {
        $width = Get-Random -Minimum 1 -Maximum 10
        Write-Host ("🐸" * $width)
        Start-Sleep -Milliseconds 70
    }
    Write-Colored "Frogs gone!" "Cyan"
}

# Squid mode
function Squid {
    Write-Colored "🦑 Squid mode activated!" "Cyan"
    $frames = @(
        "    ___\n   /   \\\n  | o o |\n   \\_-_/\n    |||\n   /|||\\\n  ( ||| )\n   \\|||/\n    vvv",
        "    ___\n   /   \\\n  | ^ ^ |\n   \\_-_/\n    |||\n   /|||\\\n  ( ||| )\n   \\|||/\n    ^^^  ",
        "    ___\n   /   \\\n  | - - |\n   \\_u_/\n    |||\n   /|||\\\n  ( ||| )\n   \\|||/\n    ~~~",
        "    ___\n   /   \\\n  | o o |\n   \\_-_/\n    |||\n   \\|||/\n  ( ||| )\n   /|||\\\n    ^^^  "
    )
    for ($cycle=0; $cycle -lt 3; $cycle++) {
        foreach ($frame in $frames) {
            Clear-Host
            Write-Colored $frame "Cyan"
            Write-Colored "\n~ Swimming through the depths ~" "Green"
            Start-Sleep -Milliseconds 400
        }
    }
    Write-Colored "🦑 Squid out!" "Cyan"
}

# Glitch effect
function Glitch {
    $chars = "█▓▒░@#$%^&*()[]{}<>~ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    $cols = $Host.UI.RawUI.WindowSize.Width
    for ($i=0; $i -lt 15; $i++) {
        Clear-Host
        for ($j=0; $j -lt 8; $j++) {
            $len = Get-Random -Minimum ([math]::Max(10, $cols/3)) -Maximum $cols
            $str = -join ((1..$len) | ForEach-Object { $chars | Get-Random })
            $color = @("Red","Green","Yellow","Cyan","Magenta","Blue","White") | Get-Random
            Write-Host $str -ForegroundColor $color
        }
        Start-Sleep -Milliseconds 70
    }
    Write-Colored "System stabilized." "Green"
}

# Boot sequence
function Boot {
    Write-Colored "🖥️ Booting Bahoot OS..." "Cyan"
    Start-Sleep -Milliseconds 500
    Write-Host "Initializing kernel..."
    Start-Sleep -Milliseconds 500
    Write-Host "Loading modules..."
    Start-Sleep -Milliseconds 500
    Write-Host "Mounting /bahoot..."
    Start-Sleep -Milliseconds 500
    Write-Host "Welcome to Bahoot OS 🤖"
}

# Fake hacking
function Hack {
    Write-Colored "💻 Hacking in progress..." "Green"
    for ($i=1; $i -le 20; $i++) {
        Write-Host "Accessing node $i... success"
        Start-Sleep -Milliseconds 100
    }
    Write-Colored "🔥 Firewall breached. Just kidding." "Red"
}

# Scan
function Scan {
    Write-Colored "🦠 Scanning system for viruses..." "Red"
    Start-Sleep -Seconds 1
    Write-Host "Found: 3 threats"
    Start-Sleep -Seconds 1
    Write-Host "Threat 1: Bahoot overload"
    Write-Host "Threat 2: Excessive swag"
    Write-Host "Threat 3: Terminal too cool"
    Write-Colored "✅ All threats neutralized." "Green"
}

# Troll mode
function Troll {
    Loader
    $messages = @("Installing virus...", "Formatting disk...", "Sending your IP to Bahoot HQ...", "Just kidding 😎")
    foreach ($msg in $messages) {
        Write-Colored $msg "Red"
        Start-Sleep -Milliseconds 500
    }
}

# Echo with flair
function EchoCmd {
    Write-Colored "🔊 You said: $($Args -join ' ')" "Cyan"
}

# Clear screen
function ClearCmd {
    Clear-Host
    Write-Colored "🧼 Screen cleared." "Green"
}

# Self-destruct
function SelfDestruct {
    Write-Colored "💣 Self-destruct sequence initiated..." "Red"
    Start-Sleep -Seconds 1
    Write-Host "Deleting Bahoot CLI from: $($MyInvocation.MyCommand.Path)"
    Remove-Item -Path $MyInvocation.MyCommand.Path -Force
}

# Update
function Update {
    Write-Colored "🔄 Updating Bahoot CLI..." "Cyan"
    $url = "https://raw.githubusercontent.com/superskibidi69/funny-cli/main/bahoot.ps1"
    Invoke-WebRequest $url -OutFile $MyInvocation.MyCommand.Path
    Write-Colored "✅ Update complete!" "Green"
}

# Help menu
function Show-Help {
    Write-Colored "Bahoot CLI 🤖 — Available commands:" "Cyan"
    Write-Host "  ball           - Bouncing ball with color trail"
    Write-Host "  banner         - Animated Bahoot ASCII logo"
    Write-Host "  boot           - Simulate Bahoot OS boot sequence"
    Write-Host "  chaos          - Print colorful chaos errors"
    Write-Host "  crab           - Crab rave animation"
    Write-Host "  credits        - Show Bahoot CLI credits"
    Write-Host "  clear          - Clear the screen"
    Write-Host "  deploy         - Launch ASCII rocket"
    Write-Host "  doctor         - Show system diagnostics"
    Write-Host "  duck           - Spam the terminal with ducks"
    Write-Host "  echo [text]    - Repeat your input with flair"
    Write-Host "  fortune        - Get a random fortune/quote"
    Write-Host "  frog           - Frog rain animation"
    Write-Host "  glitch         - Terminal glitch effect"
    Write-Host "  hack           - Fake hacking animation"
    Write-Host "  help           - Show this help menu"
    Write-Host "  matrix         - Matrix movie rain effect"
    Write-Host "  party          - Celebrate with confetti"
    Write-Host "  prank          - Fake system meltdown"
    Write-Host "  scan           - Fake virus scan"
    Write-Host "  self-destruct  - Dramatically delete Bahoot CLI"
    Write-Host "  squid          - Squid mode animation"
    Write-Host "  troll          - Print fake errors and warnings"
    Write-Host "  update         - Update Bahoot CLI from GitHub"
}

switch ($Command.ToLower()) {
    "prank" { Prank }
    "deploy" { Rocket }
    "chaos" { Chaos }
    "matrix" { Matrix }
    "doctor" { Doctor }
    "banner" { Banner }
    "update" { Update }
    "self-destruct" { SelfDestruct }
    "troll" { Troll }
    "party" { Party }
    "scan" { Scan }
    "boot" { Boot }
    "hack" { Hack }
    "glitch" { Glitch }
    "ball" { Write-Colored "Sorry, ball animation is not supported in PowerShell yet." "Yellow" }
    "squid" { Squid }
    "duck" { Duck }
    "crab" { Crab }
    "frog" { Frog }
    "fortune" { Fortune }
    "echo" { EchoCmd }
    "clear" { ClearCmd }
    "credits" { Credits }
    "help" { Show-Help }
    default { Show-Help }
}
