


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.7.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.7.1/netbird-ui_0.7.1_darwin_amd64_signed.zip"
      sha256 "dc0fed27cba30d15db09cc6e6926c3d09b4e9d27dd9c39c2cd5a213c9b0a4454"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.7.1/netbird-ui_0.7.1_darwin_arm64_signed.zip"
      sha256 "f6e7536164176a05fdc216eaa513b8efd6dff4212ab9bd834e960ac217613cd3"
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