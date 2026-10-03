cask "mimic" do
  version "0.13.0"
  sha256 "09da744f778097759c246844e54723fff88dec296a2c1599d219d0af5e6af0e6"

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
  depends_on macos: :tahoe

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
