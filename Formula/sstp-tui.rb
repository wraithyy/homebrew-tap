class SstpTui < Formula
  desc "Terminal SSTP VPN client for macOS"
  homepage "https://github.com/wraithyy/sstp-tui"
  version "0.3.0"
  license "MIT"

  on_arm do
    url "https://github.com/wraithyy/sstp-tui/releases/download/v0.3.0/sstp-0.3.0-darwin-arm64.tar.gz"
    sha256 "2f8816e917e39feb92a65e3226c8b1406ce802e78df69c686cd83f81e4f8ee63"
  end
  on_intel do
    url "https://github.com/wraithyy/sstp-tui/releases/download/v0.3.0/sstp-0.3.0-darwin-x64.tar.gz"
    sha256 "4ae43f3e041df82a51462c5a655dbd6385533d7b2101ec50e6ba1c46818113cf"
  end

  depends_on :macos
  depends_on "sstp-client"

  def install
    bin.install "sstp"
  end

  def caveats
    "Run `sstp setup` once to install the root helper."
  end

  test do
    assert_match "sstp", shell_output("#{bin}/sstp --help 2>&1", 0)
  end
end
