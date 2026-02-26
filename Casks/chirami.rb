cask "chirami" do
  version "0.0.6"
  sha256 "2a1b837f99da39234a77c1287a7221aa3b8d080cd1764ad2b26579b4434c5c5e"

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
