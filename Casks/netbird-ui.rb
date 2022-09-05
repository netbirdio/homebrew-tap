


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.8.12"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.8.12/netbird-ui_0.8.12_darwin_amd64_signed.zip"
      sha256 "bcb6b503f95fc9c2ee82d3dd6887ddfd42f697e98a84a24d33ba2cae6822b707"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.8.12/netbird-ui_0.8.12_darwin_arm64_signed.zip"
      sha256 "86acc8665f4679de85c792ea921880500e185331de0d21f89f818e7fbc8f9a6b"
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