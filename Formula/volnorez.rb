class Volnorez < Formula
  desc "Превращает MP3 в вертикальное видео с волной, обложкой и субтитрами"
  homepage "https://github.com/art-ps/volnorez"

  depends_on "ffmpeg"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/art-ps/volnorez/releases/download/v0.1.0/volnorez-darwin-amd64"
      sha256 "f13f55acb0381a8b55b64989824c254cfed1107473a07426021f1cb354653ea9"
    end
    if Hardware::CPU.arm?
      url "https://github.com/art-ps/volnorez/releases/download/v0.1.0/volnorez-darwin-arm64"
      sha256 "d20ab686b0c02cbb04d1948b3339b5ef0ce48c88c819f935a0985ca1fe194870"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/art-ps/volnorez/releases/download/v0.1.0/volnorez-linux-amd64"
      sha256 "a09bfbf84d26bb17287aec0a48a7d8d6e57989f00fbefdb8c2fde42c1cc9438e"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/art-ps/volnorez/releases/download/v0.1.0/volnorez-linux-arm64"
      sha256 "aeb905edd9def0a339db6cae21691a5fbb9fae5c06b0335ce214fb74bf9a456e"
    end
  end

  def install
    bin.install Dir["volnorez-*"].first => "volnorez"
  end

  test do
    output = shell_output("#{bin}/volnorez --help")
    assert_match "volnorez INPUT", output
  end
end
