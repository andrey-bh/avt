class Avt < Formula
  desc "Video Tools by ARAKL"
  homepage "https://github.com/andrey-bh/avt"
  version "1.0.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/andrey-bh/avt/releases/download/1.0.2/avt-darwin-arm64.tar.gz"
      sha256 "d223a859bbbf30bf6b601c46fccb38690b4609a9ee2650402e7907c785e4cc9f" # darwin_arm64
    else
      url "https://github.com/andrey-bh/avt/releases/download/1.0.2/avt-darwin-amd64.tar.gz"
      sha256 "952dfd9cf743b3f2f8d384539085f6a07e81fa2c5a0a6b5548649c1221bae462" # darwin_amd64
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/andrey-bh/avt/releases/download/1.0.2/avt-linux-arm64.tar.gz"
      sha256 "82a30807246543243387e534eb2eb4a416b97b8c072b8f1126d4e887d5009122" # linux_arm64
    else
      url "https://github.com/andrey-bh/avt/releases/download/1.0.2/avt-linux-amd64.tar.gz"
      sha256 "c4a64eb740bb6c6a01553c4dd439135033873c1e04e06a7e5b02e4678c233f90" # linux_amd64
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
