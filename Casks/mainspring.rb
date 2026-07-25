cask "mainspring" do
  version "3.0.1"
  sha256 "a9927f0758fd02f65fcdd5c2c8b05a1411cf4275a31f914486cdfd309fb914d8"

  url "https://trymainspring.com/downloads/Mainspring-#{version}.pkg"
  name "Mainspring"
  desc "Turn 90+ hidden macOS settings into one-click, reversible toggles"
  homepage "https://trymainspring.com/"

  depends_on macos: ">= :ventura"

  pkg "Mainspring-#{version}.pkg"

  uninstall pkgutil: "app.mainspring.pkg"

  zap trash: "~/Library/Preferences/app.mainspring.plist"
end
