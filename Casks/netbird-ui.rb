


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.68.3"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.68.3/netbird-ui_0.68.3_darwin_amd64_signed.zip"
      sha256 "7bd65d40c828fcca178df7fa9e416825a2208b0bb17ea9687f2d53f4f5cc7a6d"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.68.3/netbird-ui_0.68.3_darwin_arm64_signed.zip"
      sha256 "5902511bbf86595500e59528b1cd38f71bef8284bb69757326007d003ed60f8d"
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
