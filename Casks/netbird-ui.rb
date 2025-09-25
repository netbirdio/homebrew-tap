


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.58.2"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.58.2/netbird-ui_0.58.2_darwin_amd64_signed.zip"
      sha256 "89a9cb6a19d1637d7bed538e22f5833dfbb6d6738befb8c0cbd116c51e5f6e43"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.58.2/netbird-ui_0.58.2_darwin_arm64_signed.zip"
      sha256 "d9306dc699cb82355ee907089a4419c3c53f806b2694ae4a74cb823cc88d4162"
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
