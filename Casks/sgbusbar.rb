cask "sgbusbar" do
  version "0.2.1"
  sha256 "4482cf75f9555476cb8b7e289311b9f88330ee7c3cb4c5bde0c309ae6f1c03ce"

  url "https://github.com/syazfraser/SGBusBar/releases/download/v#{version}/SGBusBar-#{version}.zip"
  name "SGBusBar"
  desc "Singapore bus arrival times in the menu bar"
  homepage "https://github.com/syazfraser/SGBusBar"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "SGBusBar.app"

  zap trash: [
    "~/Library/Application Support/SGBusBar",
    "~/Library/Preferences/com.syazwanrifdi.SGBusBar.plist",
  ]

  caveats <<~EOS
    SGBusBar isn't notarised by Apple yet. The first time you open it, macOS may block it:
    open System Settings > Privacy & Security and click "Open Anyway".

    You'll also need a free LTA DataMall API key:
      https://datamall.lta.gov.sg/content/datamall/en/request-for-api.html
  EOS
end
