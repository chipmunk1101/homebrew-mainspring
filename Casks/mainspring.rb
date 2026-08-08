cask "mainspring" do
  version "3.2.1"
  sha256 "931a202dd6d4b39ebc05a555e9f102e30230f10786d5e8ed176383cc9c4a9063"

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

  uninstall pkgutil: "app.mainspring.pkg"

  zap trash: "~/Library/Preferences/app.mainspring.plist"
end
