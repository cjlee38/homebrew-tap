cask "cosmos" do
  version "0.1.4"
  sha256 "c7ece889e058bc6917897ac4adfe165c2446bec1ba490eadf241d6d11d3671ec"

  url "https://github.com/cjlee38/cosmos/releases/download/v#{version}/Cosmos-#{version}.dmg"
  name "Cosmos"
  desc "Window-level virtual desktop manager for macOS"
  homepage "https://github.com/cjlee38/cosmos"

  depends_on macos: :sonoma

  app "Cosmos.app"

  zap trash: [
    "~/.config/cosmos",
    "~/Library/Application Support/cosmos",
  ]
end
