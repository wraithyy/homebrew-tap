cask "ancre" do
  version "0.4.12"
  sha256 "a50de7654ef089e3a4184a5c1b53091e4bf651bc461631c6b78a38c97b2ca8de"

  url "https://github.com/wraithyy/ancre/releases/download/v#{version}/ancre-#{version}-macos.zip"
  name "ancre"
  desc "Hyprland-inspired tiling window manager for macOS"
  homepage "https://github.com/wraithyy/ancre"

  depends_on macos: :sonoma

  app "ancre.app"
  binary "ancrectl"

  preflight do
    system "xattr", "-dr", "com.apple.quarantine", "#{staged_path}/ancre.app"
    system "xattr", "-d", "com.apple.quarantine", "#{staged_path}/ancrectl"
  end

  caveats <<~EOS
    ancre needs Accessibility and Input Monitoring permissions; the first
    launch walks you through them. Starting it remaps CapsLock to the hyper
    key — restore anytime with:
      hidutil property --set '{"UserKeyMapping":[]}'
  EOS

  zap trash: [
    "~/.config/ancre",
    "~/Library/Application Support/ancre",
  ]
end
