


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.9.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.9.0/netbird-ui_0.9.0_darwin_amd64_signed.zip"
      sha256 "ea187e637181f21f510e0b04460b55906fb905ff6db4a41ced7e0194d056c1c9"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.9.0/netbird-ui_0.9.0_darwin_arm64_signed.zip"
      sha256 "d2918312157e198d31a6ae8ebf09fc68fe511c2a5c8c436d453555747f555bab"
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