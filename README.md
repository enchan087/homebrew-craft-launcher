# homebrew-craft-launcher

Unofficial [Homebrew](https://brew.sh) tap for
[ArtCraft Launcher](https://github.com/storytold/craft-launcher), which installs, updates and
launches the Craft App Suite. This tap is not affiliated with the ArtCraft Launcher project.

## Install

```sh
brew tap enchan087/craft-launcher
brew trust enchan087/craft-launcher
brew install --cask artcraft-launcher
```

Homebrew 7 and later only load casks from taps you have trusted, so `brew trust` is required.
Without it, `brew install` fails with `Refusing to load cask ... from untrusted tap`.

The cask installs the macOS universal DMG from the upstream
[releases](https://github.com/storytold/craft-launcher/releases) and checks it against the
release's `SHA256SUMS.txt`. Nothing is rebuilt or rehosted here.

## Updates

ArtCraft Launcher updates itself, so `brew upgrade` leaves it alone unless you run
`brew upgrade --cask --greedy artcraft-launcher`.

[`update-cask.yml`](.github/workflows/update-cask.yml) checks upstream every hour and commits
the new `version` and `sha256` when a release is published. Drafts and pre-releases are skipped.

## Uninstall

```sh
brew uninstall --cask artcraft-launcher
brew untap enchan087/craft-launcher
```

`brew uninstall --zap --cask artcraft-launcher` also removes the launcher's data, caches and login
item.
