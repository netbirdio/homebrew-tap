


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.44.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.44.0/netbird-ui_0.44.0_darwin_amd64_signed.zip"
      sha256 "4b0cade28a201409c2049311099f159c235b7e6867659eb1ed4ec2af965cf955"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.44.0/netbird-ui_0.44.0_darwin_arm64_signed.zip"
      sha256 "d2c46525b78a6f5049bfab4b211ded1b7357a9c9574427dcb209cb1384f12afc"
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
