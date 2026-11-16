# Wiggo for Windows — release builds

Installable Windows builds of Wiggo, published from the private source
repository. A release is one `Wiggo-Portable.zip` plus the two installer
scripts that ship beside it.

## Latest — 0.1.2 (2026-11-16)

- Source commit: `d690dd6`
- `Wiggo-Portable.zip` — 206.7 MB
- `Wiggo-Setup.cmd` — double-click to install
- `Wiggo-Setup.ps1` — the installer the wrapper runs
- SHA-256: see `SHA256SUMS`

## Install

1. Keep `Wiggo-Portable.zip` next to `Wiggo-Setup.cmd`.
2. Double-click `Wiggo-Setup.cmd`. It extracts the build to
   `%LOCALAPPDATA%\Programs\Wiggo` and adds a Start Menu shortcut. Nothing is
   installed system-wide and the app runs fully offline.
3. To run without installing, unzip the archive and start `Wiggo\Wiggo.exe`.

The archive stores the app under a top-level `Wiggo\` folder.

## What this build contains

- The animal window, the material library and the official catalog share one
  fixed 720×588 surface; favorites accumulate in `Materials/<uuid>/` instead
  of replacing each other.
- Imported photos get a content-derived desktop zoom, and built-in cat packs
  keep the same session stage on the desktop.
- The desktop overlay keeps its renderer alive between rests, so 结束休息
  answers on the first rest and on every later one.
- Ribbon labels shrink to fit on a single line instead of ending in an
  ellipsis, in all ten languages.

Older builds are kept in the commit history of this repository; each commit
that replaces the archive also replaces `SHA256SUMS`.