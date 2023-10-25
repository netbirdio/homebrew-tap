


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.24.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.24.1/netbird-ui_0.24.1_darwin_amd64_signed.zip"
      sha256 "7ac241599f9f6ed74b9f201461b718fe6b8a35ae9147fd96f262133b172567e4"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.24.1/netbird-ui_0.24.1_darwin_arm64_signed.zip"
      sha256 "47fd72ad9ed782c8f03ee6244887b5616f8402b80c93eb9e8535fe23ad1e5a6f"
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