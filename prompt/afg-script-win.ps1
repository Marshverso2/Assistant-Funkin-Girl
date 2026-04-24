$pag = 0
$pagmax = 4

$Host.UI.RawUI.WindowSize = New-Object Management.Automation.Host.Size(54, 25)

function Pause { Read-Host "Press Enter to continue" }

function Menu {
    Clear-Host
    Write-Host ""
    Write-Host "               /ASSISTANT FUNKIN GIRL\" -ForegroundColor Cyan
    Write-Host "======================================================"

    switch ($pag) {
        0 {
            "1. Check files"
            "2. Check storage"
            "3. Optimize storage"
            "4. Clear cache"
            "5. Check RAM"
            "6. Performance settings"
            "7. Clear DNS"
        }
        1 {
            "1. Restart network"
            "2. Fix network"
            "3. Installed apps"
            "4. App list"
            "5. Force uninstall"
            "6. Update apps"
            "7. System settings"
        }
        2 {
            "1. Disable hibernation"
            "2. Disable Windows Update"
            "3. Power diagnostics"
            "4. Enter BIOS"
            "5. System info"
            "6. Antivirus"
            "7. Maintenance"
        }
        default {
            "        AREA GITHUB"
            "1. MicroWin"
            "2. Microsoft Activation Scripts"
            "3. WinScript"
            "4. Remove Windows AI"
            "5. GitHub"
            "6. Donate"
        }
    }

    Write-Host ""
    Write-Host "0. Change Page"
    Write-Host "======================================================"
    Write-Host ""
    Write-Host "Creator: Marshverso (YT) \ Beta Tester: FandeFNF (YT)"
    Write-Host ""
    Write-Host "       MicroWin (GIT): Chris Titus Tech"
    Write-Host "Microsoft Activation Scripts (GIT): thecatontheceiling"
    Write-Host "          WinScript (GIT): flick9000"
    Write-Host "       Remove Windows 11 AI (GIT): zoicware"
    Write-Host ""
    Write-Host "======================================================"
}

# ================= FUNÇÕES =================

function Check-Files {
    sfc /scannow
    dism /online /cleanup-image /scanhealth
    dism /online /cleanup-image /restorehealth
    Pause
}

function Check-Storage {
    $d = Read-Host "Drive letter"
    chkdsk "$d`:" /f /r /x
    Pause
}

function Optimize-Storage {
    $d = Read-Host "Drive letter"
    defrag "$d`:" /O
    Pause
}

function Clear-Cache {
    Remove-Item "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item "C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
    Pause
}

function Check-RAM { mdsched }
function Perf { SystemPropertiesPerformance }
function DNS { ipconfig /flushdns; Pause }

# NETWORK
function Restart-Network {
    Disable-NetAdapter -Name "Ethernet" -Confirm:$false
    Start-Sleep 10
    Enable-NetAdapter -Name "Ethernet" -Confirm:$false
    Pause
}

function Fix-Network {
    netsh winsock reset
    netsh int ip reset
    Pause
}

# APPS
function Apps { explorer shell:AppsFolder }
function Winget-List { winget list; Pause }
function Uninstall-App {
    $app = Read-Host "App name"
    winget uninstall $app
    Pause
}
function Update-Apps { winget upgrade --all; Pause }

# SYSTEM
function Disable-Hibernation { powercfg -h off; Pause }
function Disable-WU {
    Stop-Service wuauserv -Force
    Set-Service wuauserv -StartupType Disabled
    Pause
}
function Power-Diag { powercfg -energy; Pause }
function BIOS { shutdown /r /fw /t 0 }
function SysInfo { systeminfo; Pause }
function AV { mrt }
function Maintenance { msdt.exe /id MaintenanceDiagnostic }

# ONLINE SCRIPTS
function MicroWin { irm https://christitus.com/win | iex }
function MAS { irm https://get.activated.win | iex }
function WinScript { irm https://winscript.cc/irm | iex }
function Remove-AI { irm https://raw.githubusercontent.com/zoicware/RemoveWindowsAI/main/RemoveWindowsAi.ps1 | iex }
function GitHub { start "https://github.com/Marshverso2/Assistant-Funkin-Girl" }
function Donate { start "https://youtu.be/dQw4w9WgXcQ" }

# ================= LOOP =================

while ($true) {
    Menu
    $opt = Read-Host "Select"

    if ($opt -eq "0") {
        $pag++
        if ($pag -ge $pagmax) { $pag = 0 }
        continue
    }

    switch ($pag) {
        0 {
            switch ($opt) {
                1 { Check-Files }
                2 { Check-Storage }
                3 { Optimize-Storage }
                4 { Clear-Cache }
                5 { Check-RAM }
                6 { Perf }
                7 { DNS }
            }
        }
        1 {
            switch ($opt) {
                1 { Restart-Network }
                2 { Fix-Network }
                3 { Apps }
                4 { Winget-List }
                5 { Uninstall-App }
                6 { Update-Apps }
                7 { SystemSettings }
            }
        }
        2 {
            switch ($opt) {
                1 { Disable-Hibernation }
                2 { Disable-WU }
                3 { Power-Diag }
                4 { BIOS }
                5 { SysInfo }
                6 { AV }
                7 { Maintenance }
            }
        }
        default {
            switch ($opt) {
                1 { MicroWin }
                2 { MAS }
                3 { WinScript }
                4 { Remove-AI }
                5 { GitHub }
                6 { Donate }
            }
        }
    }
}

# script by marshverso
