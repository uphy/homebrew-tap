cask "chirami" do
  version "0.0.4"
  sha256 "9a20ebcea771ca1bd07da148b0abf80d5c6feedb7e4b597f32e3e12693b5cd98"

  url "https://github.com/uphy/chirami/releases/download/v#{version}/Chirami-#{version}-macOS.zip"
  name "Chirami"
  desc "Floating sticky-note Markdown app for macOS"
  homepage "https://github.com/uphy/chirami"

  depends_on macos: ">= :sonoma"

  app "Chirami.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-d", "com.apple.quarantine", "#{appdir}/Chirami.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/com.uphy.Chirami",
    "~/Library/Preferences/com.uphy.Chirami.plist",
  ]
end
