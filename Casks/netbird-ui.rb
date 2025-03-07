


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.37.2"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.37.2/netbird-ui_0.37.2_darwin_amd64_signed.zip"
      sha256 "988b9dd7c54df7ef706fe475b81d855e86a584c7fe93d83c1bc1ce95f79f682e"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.37.2/netbird-ui_0.37.2_darwin_arm64_signed.zip"
      sha256 "f05b86d1ac2a9911dfe3ea58b8e88bea2eb4019260878c7d828e16b32250cbf1"
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
