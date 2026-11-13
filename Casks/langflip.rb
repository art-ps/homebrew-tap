cask "langflip" do
  version "0.4.3"
  sha256 "80076eac1783fa443667ea86379f5604167ab811e063b83c260a9c261de54d58"

  url "https://github.com/art-ps/langflip-site/releases/download/v#{version}/LangFlip-#{version}.dmg",
      verified: "github.com/art-ps/langflip-site/"
  name "LangFlip"
  desc "Menu bar app that fixes text typed in the wrong keyboard layout"
  homepage "https://langflip.app/"

  depends_on macos: :sonoma

  app "LangFlip.app"

  uninstall quit: "io.langflip.LangFlip"

  zap trash: [
    "~/Library/Application Support/LangFlip",
    "~/Library/Preferences/io.langflip.LangFlip.plist",
  ]

  caveats <<~EOS
    It needs the Input Monitoring and Accessibility permissions, which onboarding
    requests. The microphone is only used if you turn dictation on.
  EOS
end
