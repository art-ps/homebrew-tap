cask "langflip" do
  version "0.3.5"
  sha256 "43baccf6e106e4d66a3d5596de9ae79fc177aa81654f8f98aad78a28a9df3f7c"

  url "https://github.com/art-ps/langflip/releases/download/v#{version}/LangFlip-#{version}.dmg",
      verified: "github.com/art-ps/langflip/"
  name "LangFlip"
  desc "Menu bar app that fixes text typed in the wrong keyboard layout"
  homepage "https://github.com/art-ps/langflip"

  depends_on macos: ">= :sonoma"

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
