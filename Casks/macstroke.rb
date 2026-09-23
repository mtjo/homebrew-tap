cask "macstroke" do
  version "3.0.0"
  sha256 "f69ec4d8a77d8a7f351bfcea01317abb0dc516f9b1d87df0bb0ed8ff310bce94"

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

  zap trash: [
    "~/Library/Application Support/MacStroke",
    "~/Library/Caches/MacStroke",
    "~/Library/Preferences/net.mtjo.MacStroke.plist",
  ]
end
