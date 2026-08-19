cask "mainspring" do
  version "3.2.3"
  sha256 "ea16575c81bf96d0bd8fe13282b7c39010fdd76ca0bea8fc915bb04ad472cf61"

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
