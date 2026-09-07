cask "notchlet" do
  version "0.4.0"
  sha256 "b82c4c5647434390f5b0b6bdcba021dd687570e45abb866c216a50267653feec"

  url "https://github.com/SiebeBaree/Notchlet/releases/download/v#{version}/Notchlet-#{version}.dmg"
  name "Notchlet"
  desc "Agent CLI usage limits in the notch"
  homepage "https://github.com/SiebeBaree/Notchlet"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Sparkle owns upgrades, so brew should not fight the app over which copy is
  # newer. Notchlet's release workflow rewrites the two lines above on every tag.
  auto_updates true
  depends_on macos: :sonoma

  app "Notchlet.app"

  # An LSUIElement agent with no dock icon, so it is running whenever it is
  # installed and has to be asked to quit before the bundle is replaced.
  uninstall quit: "be.baree.Notchlet"

  # ~/.notchlet holds the hook script the agent CLIs call. Turn the wait line
  # off in settings before zapping, otherwise the entries Notchlet wrote into
  # ~/.claude/settings.json and friends are left pointing at a missing script.
  zap trash: [
    "~/.notchlet",
    "~/Library/Application Support/Notchlet",
    "~/Library/Caches/be.baree.Notchlet",
    "~/Library/HTTPStorages/be.baree.Notchlet",
    "~/Library/Preferences/be.baree.Notchlet.plist",
  ]
end
