cask "langflip" do
  version "0.4.1"
  sha256 "3b4a7a57dbe7212533c6c76ce52c0fc5f8ba214295012ec5834743c4f1feeef4"

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
    LangFlip carries a development signature and is not notarized, so Gatekeeper
    will refuse the first launch. Open it once from Finder with right-click -> Open
    and confirm both dialogs; after that it starts normally.

    It needs the Input Monitoring and Accessibility permissions, which onboarding
    requests. The microphone is only used if you turn dictation on.
  EOS
end
