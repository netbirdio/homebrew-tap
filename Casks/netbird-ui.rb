


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.73.2"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.73.2/netbird-ui_0.73.2_darwin_amd64_signed.zip"
      sha256 "9e3962b24b09774d1437da27e7b3ab3ff9c3d8ac1d3f11986ea997585ee7fbc7"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.73.2/netbird-ui_0.73.2_darwin_arm64_signed.zip"
      sha256 "e3ade12d6280de1aae8863352d9cdc73e8be17279f3d484783f8e6579fe766da"
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
