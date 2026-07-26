cask "cosmos" do
  version "0.1.2"
  sha256 "1d575c12de810f072c4c84b8b882e4d646af4260b2565ec730bd0f3a668221cd"

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
