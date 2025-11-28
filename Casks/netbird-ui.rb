


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.60.4"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.60.4/netbird-ui_0.60.4_darwin_amd64_signed.zip"
      sha256 "9adc22027278607f1d53fab8f7b2b5d3a3e2ae861a6d0dfd8d5a4b74cd62cad2"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.60.4/netbird-ui_0.60.4_darwin_arm64_signed.zip"
      sha256 "04245264818f54619a9eab71df9c55372b0e9f294d02b3afe3d02b1acce21553"
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
