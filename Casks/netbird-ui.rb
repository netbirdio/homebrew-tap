


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.14.5"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.14.5/netbird-ui_0.14.5_darwin_amd64_signed.zip"
      sha256 "d82f8e3a6f29ab9fbecc6a9efac359bbf769dcc249fb29b38f75fc54bab1951f"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.14.5/netbird-ui_0.14.5_darwin_arm64_signed.zip"
      sha256 "926026a081e2281a724eb7736d013bed178fd5fcbedf91c23ee98851281c57c5"
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