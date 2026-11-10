cask "langflip" do
  version "0.4.2"
  sha256 "2b4dfd26649b7d9999f96f1b708162131f4166a28c258253364419734ee1ddf2"

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
