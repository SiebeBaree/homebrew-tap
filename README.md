# SiebeBaree/homebrew-tap

Homebrew casks for my apps.

```sh
brew install --cask siebebaree/tap/notchlet
```

## Notchlet

[Notchlet](https://github.com/SiebeBaree/Notchlet) shows how much of your Claude
Code, Codex, Cursor and OpenCode limits are left, in the macOS notch.

The app updates itself through Sparkle, so the cask is marked `auto_updates` and
`brew upgrade` leaves it alone. To remove the archived usage history and the
hook script along with the app:

```sh
brew uninstall --zap --cask notchlet
```

Turn the agent wait line off in Notchlet's settings first. That is what takes
Notchlet's entries back out of `~/.claude/settings.json` and the other CLIs'
hook configs.

## How this tap is updated

Notchlet's release workflow rewrites `version` and `sha256` in
`Casks/notchlet.rb` and pushes here on every `v*` tag. Nothing is bumped by
hand. `brew audit` runs on every push and downloads the DMG to check the
checksum against the published release.
