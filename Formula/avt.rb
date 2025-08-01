class Avt < Formula
  desc "Video Tools by ARAKL"
  homepage "https://github.com/andrey-bh/avt"
  version "1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/andrey-bh/avt/releases/download/1.0.0/avt-darwin-arm64.tar.gz"
      sha256 "..." # darwin_arm64
    else
      url "https://github.com/andrey-bh/avt/releases/download/1.0.0/avt-darwin-amd64.tar.gz"
      sha256 "..." # darwin_amd64
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/andrey-bh/avt/releases/download/1.0.0/avt-linux-arm64.tar.gz"
      sha256 "..." # linux_arm64
    else
      url "https://github.com/andrey-bh/avt/releases/download/1.0.0/avt-linux-amd64.tar.gz"
      sha256 "..." # linux_amd64
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
