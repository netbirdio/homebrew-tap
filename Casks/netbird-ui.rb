


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.21.6"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.21.6/netbird-ui_0.21.6_darwin_amd64_signed.zip"
      sha256 "3849c8d6086fd1899495b7cba4c19c77f89478b845ea3b4103b71a0e4f7dcb3f"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.21.6/netbird-ui_0.21.6_darwin_arm64_signed.zip"
      sha256 "c247523b70da542355355d7a9e266785c91bc45800ee8a50b4b6c8172a49371e"
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