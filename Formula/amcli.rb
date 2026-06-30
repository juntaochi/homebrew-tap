class Amcli < Formula
  desc "Apple Music Command Line Interface - A powerful TUI for controlling Apple Music"
  homepage "https://github.com/juntaochi/amcli"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/juntaochi/amcli/releases/download/v0.2.1/amcli-v0.2.1-arm64-apple-darwin.tar.gz"
      sha256 "ba0e7be340f42498f8d31d66351fdc098fa977b76a6e549ecc7d86beeb541194"
    else
      url "https://github.com/juntaochi/amcli/releases/download/v0.2.1/amcli-v0.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "0b78b7cc0431f43a62bbcbdd64514b47195933215b0646a25ee5a9ab85fd4809"
    end
  end

  depends_on :macos

  def install
    bin.install "amcli"
  end

  def caveats
    <<~EOS
      AMCLI requires Apple Music to be installed on macOS.

      To get started, run:
        amcli

      For configuration options:
        amcli --help

      Default config location: ~/.config/amcli/config.toml
    EOS
  end

  test do
    assert_match "amcli", shell_output("#{bin}/amcli --version")
  end
end
