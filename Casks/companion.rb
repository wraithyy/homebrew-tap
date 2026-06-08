cask "companion" do
  version "0.1.1"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"

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
