


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.36.6"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.36.6/netbird-ui_0.36.6_darwin_amd64_signed.zip"
      sha256 "7cd964cad5bec2a3341fba3c30c7b6092cb465da6d2f30e7c8023ced25b72ddb"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.36.6/netbird-ui_0.36.6_darwin_arm64_signed.zip"
      sha256 "b89a9f17ba29bb6a38fa45ecdc30e55a2558572b9a6f2e13e7cd1031c5e68ea2"
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
