cask "pasiv" do
  version "0.4.53"
  sha256 "49a4d8fd940d697ace4f152b72cf3a7255cfcd650151f37f0271ce6cc6987d57"

  url "https://github.com/hash-rate/pasiv-releases/releases/download/v#{version}/Pasiv_#{version}_aarch64.dmg",
      verified: "github.com/hash-rate/pasiv-releases/"
  name "Pasiv"
  desc "One-button non-custodial miner that turns idle CPU/GPU time into crypto"
  homepage "https://pasiv.network/"

  livecheck do
    url "https://github.com/hash-rate/pasiv-releases/releases/latest/download/latest.json"
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
