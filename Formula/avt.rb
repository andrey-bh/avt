class Avt < Formula
  desc "Video Tools by ARAKL"
  homepage "https://github.com/andrey-bh/avt"
  version "1.0.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/andrey-bh/avt/releases/download/1.0.1/avt-darwin-arm64.tar.gz"
      sha256 "60aa70e32adb4c788419add3e231c4e4c0a8bdc969e50a7122e5ce5a96f1e753" # darwin_arm64
    else
      url "https://github.com/andrey-bh/avt/releases/download/1.0.1/avt-darwin-amd64.tar.gz"
      sha256 "178dc59c5f4af7b933c3dddcd72a033d14d6bcb0df0c85358f2d46040704e6f4" # darwin_amd64
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/andrey-bh/avt/releases/download/1.0.1/avt-linux-arm64.tar.gz"
      sha256 "9b68324b73bc7d33a163c185fe96bd1a74175aa40fcd0e4bd0d99be4e12fe4fe" # linux_arm64
    else
      url "https://github.com/andrey-bh/avt/releases/download/1.0.1/avt-linux-amd64.tar.gz"
      sha256 "2148ada714cc85fb6f551345d1c78195e63b7ea36ad8b98e331572b15f252774" # linux_amd64
    end
  end

  depends_on "ffmpeg"

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "avt-darwin-arm64" => "avt"
      else
        bin.install "avt-darwin-amd64" => "avt"
      end
    elsif OS.linux?
      if Hardware::CPU.arm?
        bin.install "avt-linux-arm64" => "avt"
      else
        bin.install "avt-linux-amd64" => "avt"
      end
    end
  end

  test do
    system "#{bin}/avt", "-v"
  end
end
