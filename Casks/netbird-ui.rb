


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.70.4"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.70.4/netbird-ui_0.70.4_darwin_amd64_signed.zip"
      sha256 "37200ec40d1cea35dc095409fb69afc6413c95c440c4a9708e4789867a54c813"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.70.4/netbird-ui_0.70.4_darwin_arm64_signed.zip"
      sha256 "cad1204c80e552fbc0503a479baebb4b198c41db7c93fc192197b6125239fa4d"
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
