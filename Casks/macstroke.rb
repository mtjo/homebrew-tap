cask "macstroke" do
  version "3.1.6"
  sha256 "97c0841c2f5b95ddc8ff7b6287e433a0854fa0d40bc42199a5561cbc47ce2004"

  # 通用二进制（arm64 + x86_64）打成同一个包，所以没有按 arch 分支的产物。
  url "https://github.com/mtjo/MacStroke/releases/download/#{version}/MacStroke.zip"
  name "MacStroke"
  desc "Global mouse gesture utility for macOS"
  homepage "https://github.com/mtjo/MacStroke"

  livecheck do
    url "https://github.com/mtjo/MacStroke/releases/latest"
    strategy :github_latest
  end

  app "MacStroke.app"

  uninstall quit: "net.mtjo.MacStroke"

  zap trash: [
    "~/Library/Application Scripts/net.mtjo.MacStroke.FinderSyncExtension",
    "~/Library/Application Support/MacStroke",
    "~/Library/Caches/MacStroke",
    "~/Library/Caches/net.mtjo.MacStroke",
    "~/Library/Containers/net.mtjo.MacStroke.FinderSyncExtension",
    "~/Library/Cookies/net.mtjo.MacStroke.binarycookies",
    "~/Library/Preferences/net.mtjo.MacStroke.plist",
  ]
end
