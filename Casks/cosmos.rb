cask "cosmos" do
  version "0.1.7"
  sha256 "08854a5130d2897bdfb3c8923b7b4f1dd4c7e415af4b10e7f6fe56b92ce857b5"

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
