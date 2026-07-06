class Amcli < Formula
  desc "Apple Music Command Line Interface - A powerful TUI for controlling Apple Music"
  homepage "https://github.com/juntaochi/amcli"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/juntaochi/amcli/releases/download/v0.3.0/amcli-v0.3.0-arm64-apple-darwin.tar.gz"
      sha256 "b0173bd6ad0873051229fbe3838dd168d38cd38aa9bb4ce49bbabed93dfd2696"
    else
      url "https://github.com/juntaochi/amcli/releases/download/v0.3.0/amcli-v0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "da84d86113ae7e01f834707a6d196caf4bfad0c4c5236222f8d6c1c3ded54219"
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
