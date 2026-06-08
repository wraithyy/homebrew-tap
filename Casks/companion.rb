cask "companion" do
  version "0.1.4"
  sha256 "47ec7d530093ac72c48b9df4d27bcfd8f4657c0fa48cb9c94f4f4f68653645cd"

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
