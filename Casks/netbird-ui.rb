


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.50.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.50.0/netbird-ui_0.50.0_darwin_amd64_signed.zip"
      sha256 "1f6ee60039dedebb83e64a78927ae29e17268a96cbabff53f96fe626b7b24cbd"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.50.0/netbird-ui_0.50.0_darwin_arm64_signed.zip"
      sha256 "cb5b16425f3c4e64346a77a40d88ed5dd33a8603caccad825ef51e56c1284486"
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
