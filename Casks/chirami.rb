cask "chirami" do
  version "0.0.2"
  sha256 "1c36eade30063255fa1b80b6e2df24d3a1db5253f18f4ae3440f45c0b6be3e54"

  url "https://github.com/uphy/chirami/releases/download/v#{version}/Chirami-#{version}-macOS.zip"
  name "Chirami"
  desc "Floating sticky-note Markdown app for macOS"
  homepage "https://github.com/uphy/chirami"

  depends_on macos: ">= :sonoma"

  app "Chirami.app"

  zap trash: [
    "~/Library/Application Support/com.uphy.Chirami",
    "~/Library/Preferences/com.uphy.Chirami.plist",
  ]
end
