#requires -Version 5.1
# Wiggo installer for Windows.
# Installs the portable build to %LOCALAPPDATA%\Programs\Wiggo and creates a
# Start Menu shortcut. Runs fully offline; the zip sits next to this script.
$ErrorActionPreference = 'Stop'

$root = $PSScriptRoot
$zip = Join-Path $root 'Wiggo-Portable.zip'
if (-not (Test-Path $zip)) {
    throw "Missing Wiggo-Portable.zip next to the installer: $zip"
}

if (Get-Process -Name 'Wiggo' -ErrorAction SilentlyContinue) {
    throw "Wiggo 正在运行，请先退出 Wiggo 再安装。"
}

$programs = Join-Path $env:LOCALAPPDATA 'Programs'
New-Item -ItemType Directory -Force -Path $programs | Out-Null
$appDir = Join-Path $programs 'Wiggo'
if (Test-Path $appDir) { Remove-Item -Recurse -Force $appDir }

Write-Host "正在安装 Wiggo 到 $appDir ..."
Expand-Archive -Path $zip -DestinationPath $programs -Force

$exePath = Join-Path $appDir 'Wiggo.exe'
if (-not (Test-Path $exePath)) { throw "安装后未找到 Wiggo.exe" }

$startMenu = Join-Path $env:APPDATA 'Microsoft\Windows\Start Menu\Programs'
if (-not (Test-Path $startMenu)) { New-Item -ItemType Directory -Force -Path $startMenu | Out-Null }
$link = Join-Path $startMenu 'Wiggo.lnk'
$wscript = New-Object -ComObject WScript.Shell
$shortcut = $wscript.CreateShortcut($link)
$shortcut.TargetPath = $exePath
$shortcut.WorkingDirectory = $appDir
$shortcut.Description = 'Wiggo 桌面休息伙伴'
$shortcut.Save()

Write-Host "完成：$exePath"
Write-Host "已创建开始菜单快捷方式：$link"
