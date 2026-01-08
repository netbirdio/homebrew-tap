


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.62.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.62.1/netbird-ui_0.62.1_darwin_amd64_signed.zip"
      sha256 "77bdf63b771ebdc862a01a968db184e589e4639480d0537b91a5cb4abac26976"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.62.1/netbird-ui_0.62.1_darwin_arm64_signed.zip"
      sha256 "5d29ab6bcc5da4d90cb333e75a5b0a0956e91333088d8d59f6f366dea8323d43"
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
