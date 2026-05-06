


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.70.5"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.70.5/netbird-ui_0.70.5_darwin_amd64_signed.zip"
      sha256 "f45eeb6a7b466023829867c663b6b5d6e27294c5dbedced95554fee12b18fb9a"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.70.5/netbird-ui_0.70.5_darwin_arm64_signed.zip"
      sha256 "6bc2217d85996739306394a6ae0a854986f83976185ee6b2ce10278684376b6a"
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
