


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.36.7"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.36.7/netbird-ui_0.36.7_darwin_amd64_signed.zip"
      sha256 "f4a804c8adf2595cb5670b0476477040915292cb5e85bf7d92eb25a7c10f1629"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.36.7/netbird-ui_0.36.7_darwin_arm64_signed.zip"
      sha256 "7921498bd8f8156a350418ade7a60e3a5de77fb28c1a5d8ece3b4e5983c90b12"
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
