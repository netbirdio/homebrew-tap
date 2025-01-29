


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.36.5"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.36.5/netbird-ui_0.36.5_darwin_amd64_signed.zip"
      sha256 "336485f3625c41d977b8317917f5408b0e4e046f8df9b260a3aef6362307bca9"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.36.5/netbird-ui_0.36.5_darwin_arm64_signed.zip"
      sha256 "c9eec308a97e36771ddffc0b852c63e039a454e1f9f3f8c8b3c916d23d9aa6b7"
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
