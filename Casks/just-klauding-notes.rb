cask "just-klauding-notes" do
  version "0.2.0"
  sha256 "61a9badb64808b5384f75f0408365f4c8dee1a29a75336f00706ddabc79964e5"

  url "https://github.com/wraithyy/just-klauding-notes/releases/download/v#{version}/Just.Klauding.Notes_#{version}_universal.dmg"
  name "Just Klauding Notes"
  desc "Native macOS app for a plain-markdown notes vault, powered by Claude Code"
  homepage "https://github.com/wraithyy/just-klauding-notes"

  depends_on formula: "ripgrep"

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
