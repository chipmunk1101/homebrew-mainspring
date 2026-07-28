cask "mainspring" do
  version "3.0.3"
  sha256 "f8e4615f0d5ac9aef9a92ed6a0bc703ead10b9c6ddb06e9fa8e56538034072af"

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
