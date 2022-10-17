


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.10.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.10.0/netbird-ui_0.10.0_darwin_amd64_signed.zip"
      sha256 "e236e2c45d0f90b65e342391157705d61fdb5a6a5384a98e17e1154ebb6f077a"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.10.0/netbird-ui_0.10.0_darwin_arm64_signed.zip"
      sha256 "904a111ed1701c4a7f7cacedd3c6c3457cfc9babe1100c88b3816c9400fb6aa4"
      app "netbird_ui_darwin_arm64", target: "Netbird UI.app"
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