


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.59.8"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.59.8/netbird-ui_0.59.8_darwin_amd64_signed.zip"
      sha256 "b30ffa35b0dd01dd8afb0e26a3dff0e0e18e35aed43d5910666e347f10efd323"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.59.8/netbird-ui_0.59.8_darwin_arm64_signed.zip"
      sha256 "67e413f706e341c915daa0d82736ccd87c7cb9ea1a2bb5a04ba9bc59c1d980dc"
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
