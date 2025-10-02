


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.59.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.59.1/netbird-ui_0.59.1_darwin_amd64_signed.zip"
      sha256 "77ce32e4e1afde5179a5e34711c342672c1fea701f8da383f44d7a46e7c6b362"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.59.1/netbird-ui_0.59.1_darwin_arm64_signed.zip"
      sha256 "29251781cc37895de70db6aec4a16b04173611952458cdc29cdb2c282f3d41ac"
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
