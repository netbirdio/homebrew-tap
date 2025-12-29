


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.61.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.61.0/netbird-ui_0.61.0_darwin_amd64_signed.zip"
      sha256 "fc43f5515c07719613b8c1ea9e376df18d6d89f9e08c9f9699e7de8c0926c676"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.61.0/netbird-ui_0.61.0_darwin_arm64_signed.zip"
      sha256 "d156999ffa6c721d19b3eeddada493c6e42c18d4f76428f53c9d36491e5cf470"
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
