cask "pasiv" do
  version "0.4.42"
  sha256 "a86c99162f5dd72540691017580574cbb3ab7c36478c4970d548eb5135f8222d"

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
