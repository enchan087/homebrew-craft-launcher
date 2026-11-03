cask "artcraft-launcher" do
  version "0.14.0"
  sha256 "4beb204ec62c3e33b68adfe65cc00eac055b195e34eaf706fb5dff6799fb7e27"

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
