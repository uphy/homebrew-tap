cask "chirami" do
  version "0.0.8"
  sha256 "d716982574981e6c37f731026115d36210811f345206e1cd0e813002be59e942"

  url "https://github.com/uphy/chirami/releases/download/v#{version}/Chirami-#{version}-macOS.zip"
  name "Chirami"
  desc "Floating sticky-note Markdown app for macOS"
  homepage "https://github.com/uphy/chirami"

  depends_on macos: ">= :sonoma"

  app "Chirami.app"
  binary "#{appdir}/Chirami.app/Contents/MacOS/Chirami", target: "chirami"

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
