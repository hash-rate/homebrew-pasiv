cask "pasiv" do
  version "0.4.8"
  sha256 "bd456d3579d0773f1913248cf32288bc9eb3fa8089d51d2a70da0f7ae30d6f47"

  url "https://github.com/simoncrean/pasiv-releases/releases/download/v#{version}/Pasiv_#{version}_aarch64.dmg",
      verified: "github.com/simoncrean/pasiv-releases/"
  name "Pasiv"
  desc "One-button non-custodial miner that turns idle CPU/GPU time into crypto"
  homepage "https://pasiv.network/"

  livecheck do
    url "https://github.com/simoncrean/pasiv-releases/releases/latest/download/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true          # the app ships a signed auto-updater
  depends_on arch: :arm64    # Apple Silicon only (VerusHash is AES-accelerated)
  depends_on macos: :big_sur

  app "Pasiv.app"

  zap trash: [
    "~/Library/Application Support/app.pasiv.desktop",
    "~/Library/Caches/app.pasiv.desktop",
    "~/Library/Preferences/app.pasiv.desktop.plist",
    "~/Library/Saved Application State/app.pasiv.desktop.savedState",
  ]
end
