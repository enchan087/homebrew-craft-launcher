cask "artcraft-launcher" do
  version "0.16.1"
  sha256 "c092ab7586b34b7861b3e47728d689986575f83428f72222e5fe9090c97f6a66"

  url "https://github.com/storytold/craft-launcher/releases/download/v#{version}/artcraft-launcher-#{version}-macos-universal.dmg"
  name "ArtCraft Launcher"
  desc "Installs, updates and launches the Craft App Suite"
  homepage "https://github.com/storytold/craft-launcher"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on :macos

  app "ArtCraft Launcher.app"

  uninstall launchctl: "ai.storyteller.artcraft-launcher",
            quit:      "ai.storyteller.artcraft-launcher"

  zap trash: [
    "~/Library/Application Support/ArtCraft Launcher",
    "~/Library/Caches/ArtCraft Launcher",
    "~/Library/LaunchAgents/ai.storyteller.artcraft-launcher.plist",
  ]
end
