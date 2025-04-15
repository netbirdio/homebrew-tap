


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.41.2"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.41.2/netbird-ui_0.41.2_darwin_amd64_signed.zip"
      sha256 "581340beedd035472b162bf5283c9178946a4f4c5bf9e64a8e3aae11c2c094e3"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.41.2/netbird-ui_0.41.2_darwin_arm64_signed.zip"
      sha256 "6105931c09829b71bf13a788fe5af9756dbf5e541efc69c49def52828831b6d3"
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
