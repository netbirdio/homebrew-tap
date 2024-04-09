


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.27.2"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.27.2/netbird-ui_0.27.2_darwin_amd64_signed.zip"
      sha256 "93e692a37b87c148a0984756214f83d18e56cd3eeab8dc89dac0b7eceaaf13dd"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.27.2/netbird-ui_0.27.2_darwin_arm64_signed.zip"
      sha256 "ca1eaf6107c2ff0cea34ac2de323fad87af7190d21aeb46aa8158be4f5063047"
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