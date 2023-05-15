


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.20.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.20.0/netbird-ui_0.20.0_darwin_amd64_signed.zip"
      sha256 "b92c713b85aa0a97802bf2daf50b9faca09332b62fc78b9ee266d743e88fd651"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.20.0/netbird-ui_0.20.0_darwin_arm64_signed.zip"
      sha256 "a4a719a390a4dff11fdfab578f115a97a2ccedf1ec9655d650b71330aaf5f7ff"
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