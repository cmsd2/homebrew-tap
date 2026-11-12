cask "mdview" do
  arch arm: "aarch64", intel: "x64"

  # Placeholders until the first published cmsd2/mdview release; bump.py
  # fills in the version and both checksums.
  version "0.0.0"
  sha256 arm:   "0000000000000000000000000000000000000000000000000000000000000000",
         intel: "0000000000000000000000000000000000000000000000000000000000000000"

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
