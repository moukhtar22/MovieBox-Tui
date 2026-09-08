class MovieboxTui < Formula
  VERSION = "0.1.18"
  MACOS_SHA256 = "9a12cef16ab2d8cae62db7c95c2314c60482e49007200af539b00a8d24b99e56"
  LINUX_X64_SHA256 = "c28625ccdd2bab444d40ee6a6f7a697d1581c8d0b4df472d89f063d1fad42bc4"
  LINUX_ARM64_SHA256 = "a7c5b252120e2b19e4a4ea5ed0f9281551589dd2cb02828d4a1ca458dc4bb19f"

  desc "Stream movies, shows, anime, and live TV from your terminal"
  homepage "https://github.com/mesamirh/MovieBox-Tui"
  version VERSION
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    url "https://github.com/mesamirh/MovieBox-Tui/releases/download/v#{VERSION}/MovieBox_macOS_Universal.tar.gz"
    sha256 MACOS_SHA256
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mesamirh/MovieBox-Tui/releases/download/v#{VERSION}/MovieBox_Linux_arm64.tar.gz"
      sha256 LINUX_ARM64_SHA256
    else
      url "https://github.com/mesamirh/MovieBox-Tui/releases/download/v#{VERSION}/MovieBox_Linux_x64.tar.gz"
      sha256 LINUX_X64_SHA256
    end
  end

  def install
    bin.install "moviebox-tui"
  end

  test do
    system "#{bin}/moviebox-tui", "--version"
  end
end
