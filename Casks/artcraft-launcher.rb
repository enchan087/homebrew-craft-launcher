cask "artcraft-launcher" do
  version "0.14.1"
  sha256 "d98ceacdce44383bca7412c0b46dfe018f8eb6e8beb8bc58895f13812df150b0"

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
