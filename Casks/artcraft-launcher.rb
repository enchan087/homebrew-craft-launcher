cask "artcraft-launcher" do
  version "0.20.0"
  sha256 "4d3781b845734d62785ad2ce15dc5e362590578519ca6996991ad4d5feea472d"

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
