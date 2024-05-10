


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.27.5"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.27.5/netbird-ui_0.27.5_darwin_amd64_signed.zip"
      sha256 "b29c180b1a7a1f9e2ff33b291f90262152ead835f8ccdd53b2af56ddb4c0b53c"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.27.5/netbird-ui_0.27.5_darwin_arm64_signed.zip"
      sha256 "7c39f7083bd034462153822de54ae3bcffe546fcccb7c702559be8adfadcae76"
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