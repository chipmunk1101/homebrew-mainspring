cask "mainspring" do
  version "3.4.0"
  sha256 "84ecee1c7b48d1170cf6df35594735a7137dfe1b92a5f364e957cbeb3b81c67e"

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
