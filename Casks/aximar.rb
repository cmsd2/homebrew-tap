cask "aximar" do
  arch arm: "aarch64", intel: "x64"

  version "0.15.2"
  sha256 arm:   "87d6ba820b3f35e1b286c9d33b2aa93293de6d14d251c5117b09798a25051daa",
         intel: "246a28471729c145723d6fcb4293d6f76ca1a31c2c523f1141394c22782a6b55"

  url "https://github.com/cmsd2/aximar/releases/download/v#{version}/Aximar_#{version}_#{arch}.dmg"
  name "Aximar"
  desc "Desktop GUI for the Maxima computer algebra system"
  homepage "https://github.com/cmsd2/aximar"

  livecheck do
    url :url
    regex(/^v(\d+(?:\.\d+)+)$/i)
  end

  # Language server, debug adapter and MCP server, released separately.
  depends_on formula: "cmsd2/tap/aximar-tools"

  app "Aximar.app"

  zap trash: [
    "~/Library/Application Support/com.aximar.app",
    "~/Library/Caches/com.aximar.app",
    "~/Library/Preferences/com.aximar.app.plist",
    "~/Library/Saved Application State/com.aximar.app.savedState",
    "~/Library/WebKit/com.aximar.app",
  ]
end
