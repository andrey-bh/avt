class Avt < Formula
  desc "Video Tools by ARAKL"
  homepage "https://github.com/andrey-bh/avt"
  version "1.0.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/andrey-bh/avt/releases/download/1.0.1/avt-darwin-arm64.tar.gz"
      sha256 "9ac6e566c0c4a2e1364f416cfe5fc624f3c67571c51c2d3ce74f9c764b593448" # darwin_arm64
    else
      url "https://github.com/andrey-bh/avt/releases/download/1.0.1/avt-darwin-amd64.tar.gz"
      sha256 "d72c11cb13950c22c7bcc271a9a8c8833279bf3e118d580c6392b91cd76e7a64" # darwin_amd64
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/andrey-bh/avt/releases/download/1.0.1/avt-linux-arm64.tar.gz"
      sha256 "a808b7fc6204272caeaff3183da4917ae0dc52b6161292f2bc8c203eed29066b" # linux_arm64
    else
      url "https://github.com/andrey-bh/avt/releases/download/1.0.1/avt-linux-amd64.tar.gz"
      sha256 "8d7019c663e32b962c6788c660fb9f0e3d1f0eb1fb022e18c20c685a0ee09cc5" # linux_amd64
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
