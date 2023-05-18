


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.20.2"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.20.2/netbird-ui_0.20.2_darwin_amd64_signed.zip"
      sha256 "6166645cab95cd9153b9c1888d2078e275b884191bc7f9352ddb42dc56a8fff3"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.20.2/netbird-ui_0.20.2_darwin_arm64_signed.zip"
      sha256 "a74492898a3d494d42a2a1331ab8ac15ee7dc315738dd62ea04d1f2b84b483eb"
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