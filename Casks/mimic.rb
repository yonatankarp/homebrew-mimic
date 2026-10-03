cask "mimic" do
  version "0.12.0"
  sha256 "feb754cba191566273c7e57e1922704b396e812dd00c3d7d5b485c4a0b20e765"

  url "https://github.com/yonatankarp/mimic/releases/download/v#{version}/Mimic-#{version}.dmg"
  name "Mimic"
  desc "Turns a picture or a description into a 3D-printable miniature"
  homepage "https://yonatankarp.com/mimic/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Mimic updates itself (Sparkle).
  auto_updates true
  depends_on arch: :arm64
  depends_on macos: ">= :tahoe"

  app "Mimic.app"
  binary "#{appdir}/Mimic.app/Contents/MacOS/mimic"

  # Your minis stay in Documents/Mimic.
  zap trash: [
    "~/Library/Application Support/Mimic",
    "~/Library/Caches/com.mimic.app",
    "~/Library/HTTPStorages/com.mimic.app",
    "~/Library/Preferences/com.mimic.app.plist",
    "~/Library/Saved Application State/com.mimic.app.savedState",
  ]
end
