


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.45.3"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.45.3/netbird-ui_0.45.3_darwin_amd64_signed.zip"
      sha256 "5e320374f6579498fc330e774d38e47fa5b7b6d57e35ec839ee001fbd4beffa0"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.45.3/netbird-ui_0.45.3_darwin_arm64_signed.zip"
      sha256 "8daa06294a1c21b8daa1b79ab761440172e8b3c50bb2a09dd0e211a9dac42680"
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
