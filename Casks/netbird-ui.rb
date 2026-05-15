


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.71.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.71.1/netbird-ui_0.71.1_darwin_amd64_signed.zip"
      sha256 "b8db06fd7808e0af3c85c582aed79084f8f32cf45bd9e602dbc67964b976c345"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.71.1/netbird-ui_0.71.1_darwin_arm64_signed.zip"
      sha256 "83cbaefb83bc4eb49f11c04748c87ee0c482f99c80486ccbb9ac2428290accd8"
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
