


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.31.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.31.0/netbird-ui_0.31.0_darwin_amd64_signed.zip"
      sha256 "086655f9270d03a5b95d0e9a8e53af18bc57a3c12ac9c245ac3669e30b8c927f"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.31.0/netbird-ui_0.31.0_darwin_arm64_signed.zip"
      sha256 "fe32afe04a499a284c2dd82eaafdb9b373a27e472e2b07d8a403b7341815e158"
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
