


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.22.3"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.22.3/netbird-ui_0.22.3_darwin_amd64_signed.zip"
      sha256 "cb6d56188e1539e53c47ab0456215529e208cf32e9a26579fa6ad88c329eb9ca"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.22.3/netbird-ui_0.22.3_darwin_arm64_signed.zip"
      sha256 "48ba59c237926ec7963db29c3808a8e1b8a515e5f505b857bee20305c4ba8c68"
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