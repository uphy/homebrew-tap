cask "chirami" do
  version "0.0.3"
  sha256 "3bf2f9c7059484f5881ca1e5d3e96ddfabbd6fecefdd7daaee6a8dceb35f8eca"

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
