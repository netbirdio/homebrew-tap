


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.26.5"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.26.5/netbird-ui_0.26.5_darwin_amd64_signed.zip"
      sha256 "7d6a7fca8330b75cf955d651040d4979db7e4af912435c3ad4a29f81483b306f"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.26.5/netbird-ui_0.26.5_darwin_arm64_signed.zip"
      sha256 "8018bbbe5a5848ba42aafaff45de8e1a70d1e1eb2cafa9b5a021db5ae112f0dd"
      app "netbird_ui_darwin_arm64", target: "Netbird UI.app"
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