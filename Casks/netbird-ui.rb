


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.71.3"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.71.3/netbird-ui_0.71.3_darwin_amd64_signed.zip"
      sha256 "afa0d127fb625425cf5daa786b8d948a6bc276115e8209107474acbb2d2d5d84"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.71.3/netbird-ui_0.71.3_darwin_arm64_signed.zip"
      sha256 "7b7d04de073a71f020bdffa64a064e0ad7474ec340321f83a0e2671e46374403"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  end

  depends_on formula: "netbird"

  postflight do
    set_permissions "/Applications/Netbird UI.app/installer.sh", '0755'
    set_permissions "/Applications/Netbird UI.app/uninstaller.sh", '0755'
  end

  postflight do
    system_command "#{appdir}/Netbird UI.app/installer.sh",
                   args: ["#{version}"],
                   sudo: true
  end

  uninstall_preflight do
    system_command "#{appdir}/Netbird UI.app/uninstaller.sh",
                   sudo: false
  end

  name "Netbird UI"
  desc "Netbird UI Client"
  homepage "https://www.netbird.io/"
end
