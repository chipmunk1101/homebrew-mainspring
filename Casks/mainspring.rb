cask "mainspring" do
  version "3.3.0"
  sha256 "64228e1af14045b7d2f6ff8ff50f237cc6461e2246f0a568f896293b32837e4d"

  url "https://trymainspring.com/downloads/Mainspring-#{version}.pkg",
      verified: "trymainspring.com/"
  name "Mainspring"
  desc "Utility for reversibly toggling hidden system settings"
  homepage "https://trymainspring.com/"

  livecheck do
    url "https://trymainspring.com/downloads/Mainspring.pkg"
    strategy :header_match do |headers|
      headers["content-disposition"][/Mainspring[._-]v?(\d+(?:\.\d+)+)\.pkg/i, 1]
    end
  end

  depends_on macos: :ventura

  pkg "Mainspring-#{version}.pkg"

  uninstall quit:    "app.mainspring",
            pkgutil: "app.mainspring.pkg"

  zap trash: [
    "~/Library/Application Support/Mainspring",
    "~/Library/Caches/app.mainspring",
    "~/Library/Preferences/app.mainspring.plist",
  ]
end
