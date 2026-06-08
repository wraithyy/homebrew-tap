cask "companion" do
  version "0.1.2"
  sha256 "bdac178947ad3126397257889e42a368ec47de2090372a0b8b0df3885e34f862"

  url "https://github.com/wraithyy/companion/releases/download/v#{version}/Companion_#{version}_aarch64.dmg"
  name "Companion"
  desc "Pixel art desktop companion for Claude Code"
  homepage "https://github.com/wraithyy/companion"

  app "Companion.app"

  caveats <<~EOS
    Companion is not code-signed. On first launch:
      Right-click → Open, or run:
      xattr -dr com.apple.quarantine /Applications/Companion.app
  EOS
end
