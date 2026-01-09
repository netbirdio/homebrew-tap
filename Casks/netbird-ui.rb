


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.62.2"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.62.2/netbird-ui_0.62.2_darwin_amd64_signed.zip"
      sha256 "300242639b55d9a4c3bbfea5ce7271593265091520bd6d9d17a61831b521f457"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.62.2/netbird-ui_0.62.2_darwin_arm64_signed.zip"
      sha256 "d801633b108ae4be4c7209d2f48ef19763397a3cfcfad86a61e631727c8370b5"
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
