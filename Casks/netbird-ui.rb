


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.25.4"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.25.4/netbird-ui_0.25.4_darwin_amd64_signed.zip"
      sha256 "80f5400d94239e5cc957cce053b5e62b609cbf61185299aecf39cfa2c4d51883"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.25.4/netbird-ui_0.25.4_darwin_arm64_signed.zip"
      sha256 "84e99ae58ae41fad67bbfef4f7172dac4d748245a172a07c7fd99a6a496f4e38"
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