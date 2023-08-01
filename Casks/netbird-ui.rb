


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.22.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.22.0/netbird-ui_0.22.0_darwin_amd64_signed.zip"
      sha256 "5860125e12514c3ce3c3aa984d970fe4665fc4a83a9dbda31c8c933b2e6b3017"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.22.0/netbird-ui_0.22.0_darwin_arm64_signed.zip"
      sha256 "29e9b729ead0f54146ee3ce8d9c846f8bcd6040c29aa671e70d06f5811a0fb67"
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