cask "artcraft-launcher" do
  version "0.11.1"
  sha256 "f8e658b8246ad9377c265e802b0d4af016a46012f238d37e2859d97c8972aa97"

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
