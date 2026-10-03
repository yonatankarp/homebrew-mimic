cask "mimic" do
  version "0.14.0"
  sha256 "faf661cd9717bf5439a0574277d2cc43c65fa5bd7e48d72b83c0aaf4216904d8"

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
