cask "cosmos" do
  version "0.1.7"
  sha256 "f9163c0c08d6d2a6e496ce33bd124e0eb6b6070d40865b8b39b1521a4f30a160"

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
