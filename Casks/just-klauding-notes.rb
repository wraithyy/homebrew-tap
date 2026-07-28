cask "just-klauding-notes" do
  version "0.3.0"
  sha256 "9a4b6ce68d8e5b86bb7bef31f04c00bb4d1588de01876b7355f8e6836cad8754"

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
