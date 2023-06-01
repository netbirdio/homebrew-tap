


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.20.8"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.20.8/netbird-ui_0.20.8_darwin_amd64_signed.zip"
      sha256 "bbcd302e28201908664d8a522c129d7726a468786e87511bfe812f03e01e0783"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.20.8/netbird-ui_0.20.8_darwin_arm64_signed.zip"
      sha256 "e2eb404324340c35ff42d78ac9d1f1274d3d9b27c81913359c86fb92975f5e52"
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