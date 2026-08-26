cask "ancre" do
  version "0.1.0"
  sha256 "99f4f8debdf791fc507c29b00fedfa6d237187bde70c718e60e371c814ee66fb"

  url "https://github.com/wraithyy/ancre/releases/download/v#{version}/ancre-#{version}-macos.zip"
  name "ancre"
  desc "Hyprland-inspired tiling window manager for macOS"
  homepage "https://github.com/wraithyy/ancre"

  depends_on macos: ">= :sonoma"

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
