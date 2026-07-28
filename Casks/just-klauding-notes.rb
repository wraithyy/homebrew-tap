cask "just-klauding-notes" do
  version "0.7.0"
  sha256 "c273910469711b3ea52699d253756fe4712067c21805a7b3827eca927a489edd"

  url "https://github.com/wraithyy/just-klauding-notes/releases/download/v#{version}/Just.Klauding.Notes_#{version}_universal.dmg"
  name "Just Klauding Notes"
  desc "Plain-markdown notes vault app powered by Claude Code"
  homepage "https://github.com/wraithyy/just-klauding-notes"

  depends_on formula: "ripgrep"
  depends_on macos: :big_sur

  app "Just Klauding Notes.app"

  preflight do
    system "xattr", "-dr", "com.apple.quarantine", "#{staged_path}/Just Klauding Notes.app"
  end

  zap trash: [
    "~/.config/just-klauding-notes",
    "~/Library/Saved Application State/com.wraithy.notes-gui.savedState",
    "~/Library/WebKit/com.wraithy.notes-gui",
  ]
end
