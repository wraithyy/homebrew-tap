cask "ancre" do
  version "0.4.11"
  sha256 "7261ea6440cef6332a38a84b5740de3b7c85599b80ad441ce5d55f75a21cb83f"

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
