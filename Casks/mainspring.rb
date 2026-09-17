cask "mainspring" do
  version "3.3.1"
  sha256 "672b151d4fafa1decce51f606bad0b9c8236ce1069f46df2ec1563ce6312e070"

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
