cask "macstroke" do
  version "3.2.3"
  sha256 "3124871ac18baf0a7cd77c5d4ee11e22317af8c272bf83df0fe657b82004b390"

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
