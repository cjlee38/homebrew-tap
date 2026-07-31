cask "cosmos" do
  version "0.1.6"
  sha256 "109b8b9e2ebed2614c537c1c8a2d917a51d1b7c12be7c1630298be62e4ac8a42"

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
