


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.25.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.25.0/netbird-ui_0.25.0_darwin_amd64_signed.zip"
      sha256 "8f059bf27060724cfc9f1fe00f12514c4669a05eb3d23f17bd135d29215bd6e0"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.25.0/netbird-ui_0.25.0_darwin_arm64_signed.zip"
      sha256 "4de2523a66c2e5dcc5d5a83ff583bc39318f928cdcceed95187a387ca2c5276a"
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