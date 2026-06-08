cask "companion" do
  version "0.1.3"
  sha256 "d4104008cc110ee26391e8582c23133d47003c68614a676f321072fb97e68082"

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
