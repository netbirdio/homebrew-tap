


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.65.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.65.0/netbird-ui_0.65.0_darwin_amd64_signed.zip"
      sha256 "35f01172feb738e9a4729c56ffdc8f7da37a551e74dfd3280fe62ba8f05ff619"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.65.0/netbird-ui_0.65.0_darwin_arm64_signed.zip"
      sha256 "60d7abf2ce2f7e12a0a1501bd7101c5ae6ca1f9455dc91c8513377d9beb6aff4"
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
