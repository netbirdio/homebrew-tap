


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.21.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.21.0/netbird-ui_0.21.0_darwin_amd64_signed.zip"
      sha256 "b1936014156a23c05058fb1d999f84f13e21e752cb6dbc18b85f95ba6574879f"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.21.0/netbird-ui_0.21.0_darwin_arm64_signed.zip"
      sha256 "d3e65624671071710689405dbcdceb70fa0a3359a843b54a5e967e30e893e1b2"
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