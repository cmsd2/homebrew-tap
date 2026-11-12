cask "mdview" do
  arch arm: "aarch64", intel: "x64"

  # Placeholders until the first published cmsd2/mdview release; bump.py
  # fills in the version and both checksums.
  version "0.2.0"
  sha256 arm:   "4966c5ac042a28bd703de46b91e8c9bf3955470911ecc54ebaf792af594f0072",
         intel: "9c3b6e691a2984a6f1960b6c5c0f8a60ff7f2f57d0f0d77ee5a928c14d0006d2"

  url "https://github.com/cmsd2/mdview/releases/download/v#{version}/mdview_#{version}_#{arch}.dmg"
  name "mdview"
  desc "Lightweight, read-only Markdown viewer with live reload"
  homepage "https://github.com/cmsd2/mdview"

  livecheck do
    url :url
    regex(/^v(\d+(?:\.\d+)+)$/i)
  end

  app "mdview.app"
  binary "#{appdir}/mdview.app/Contents/MacOS/mdview"

  zap trash: [
    "~/Library/Application Support/mdview",
    "~/Library/Caches/dev.mdview.app",
    "~/Library/Preferences/dev.mdview.app.plist",
    "~/Library/Saved Application State/dev.mdview.app.savedState",
    "~/Library/WebKit/dev.mdview.app",
  ]
end
