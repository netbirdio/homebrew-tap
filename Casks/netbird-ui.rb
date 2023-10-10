


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.23.8"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.23.8/netbird-ui_0.23.8_darwin_amd64_signed.zip"
      sha256 "1fefa239f1fff78fe4eb60e092fd7ed9ce2523585ab403963329975f72d04a56"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.23.8/netbird-ui_0.23.8_darwin_arm64_signed.zip"
      sha256 "1f35da6a21e4531f52bfa3cc3309a43dabe6962e17280e32ae4f9511e8f259e9"
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