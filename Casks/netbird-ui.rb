


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.37.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.37.1/netbird-ui_0.37.1_darwin_amd64_signed.zip"
      sha256 "14bacb594874161ee46b0dd55e71691801ad8d6581b3618fe5c3b71e1fe8fdaa"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.37.1/netbird-ui_0.37.1_darwin_arm64_signed.zip"
      sha256 "ae4ac04a99ed33e274e2c76cc44e74f6b82413d5779ed6177497e58299c57013"
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
