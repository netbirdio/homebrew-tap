


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.39.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.39.1/netbird-ui_0.39.1_darwin_amd64_signed.zip"
      sha256 "c5044bec99dc3deb504bb7b9d6184149251fce5b3f5bd4f569df07323a4154a9"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.39.1/netbird-ui_0.39.1_darwin_arm64_signed.zip"
      sha256 "f6f7fff8d397ba24ba6d56836f688ed20ffb1362e33d257f08191716980341fd"
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
