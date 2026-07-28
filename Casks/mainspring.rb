cask "mainspring" do
  version "3.0.2"
  sha256 "2a41c1d5c86f7b1f8462b0dc592e8aad3bd58bf16b1a1d3f71570d85be14c6df"

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
