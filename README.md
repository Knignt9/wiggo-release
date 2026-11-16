# Wiggo for Windows — release builds

Installable Windows builds of Wiggo, published from the private source
repository. Every version lives in its own folder together with the two
installer scripts that ship beside the archive, and the git tag of the same
name points at that folder's commit.

## Versions

| Version | Date | Source commit | Archive |
| ------- | ---- | ------------- | ------- |
| 0.1.2 | 2026-11-16 | `d690dd6` | `v0.1.2/Wiggo-Portable.zip` (206.7 MB) |

Each folder holds:

- `Wiggo-Portable.zip` — the app, stored through Git LFS.
- `Wiggo-Setup.cmd` — double-click to install.
- `Wiggo-Setup.ps1` — the installer the wrapper runs.

`SHA256SUMS` lists every archive by path.

## Install a version

1. Download `Wiggo-Portable.zip`, `Wiggo-Setup.cmd` and `Wiggo-Setup.ps1`
   from the version folder, keeping them together.
2. Double-click `Wiggo-Setup.cmd`. It extracts the build to
   `%LOCALAPPDATA%\Programs\Wiggo` and adds a Start Menu shortcut. Nothing is
   installed system-wide and the app runs fully offline.
3. To run without installing, unzip the archive and start `Wiggo\Wiggo.exe`.

The archive stores the app under a top-level `Wiggo\` folder.

## Cloning

The archives are Git LFS objects. Install Git LFS once, then clone as usual.
To get one version without downloading every archive:

```sh
GIT_LFS_SKIP_SMUDGE=1 git clone git@github.com:Knignt9/wiggo-release.git
cd wiggo-release
git lfs pull --include "v0.1.2/*"
```

## Adding a version

From the app repository (`windows/`):

```sh
npm run package && npm run package:installer
mkdir -p ../wiggo-release/vX.Y.Z
cp dist/windows/Wiggo-Portable.zip dist/windows/Wiggo-Setup.* ../wiggo-release/vX.Y.Z/
```

Then in this repository add the archive's line to `SHA256SUMS`, add a row to
the table above, commit, tag the commit with the version, and push both:

```sh
sha256sum vX.Y.Z/Wiggo-Portable.zip >> SHA256SUMS
git add -A && git commit -m "Publish vX.Y.Z"
git tag -a vX.Y.Z -m "Wiggo X.Y.Z for Windows (source <commit>)"
git push origin main && git push origin vX.Y.Z
```

Old version folders stay in place; a full clone downloads every archive
through LFS, so use the partial pull above when only one version is needed.

## What 0.1.2 contains

- The animal window, the material library and the official catalog share one
  fixed 720×588 surface; favorites accumulate in `Materials/<uuid>/` instead
  of replacing each other.
- Imported photos get a content-derived desktop zoom, and built-in cat packs
  keep the same session stage on the desktop.
- The desktop overlay keeps its renderer alive between rests, so 结束休息
  answers on the first rest and on every later one.
- Ribbon labels shrink to fit on a single line instead of ending in an
  ellipsis, in all ten languages.