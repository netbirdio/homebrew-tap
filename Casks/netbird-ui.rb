


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.65.2"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.65.2/netbird-ui_0.65.2_darwin_amd64_signed.zip"
      sha256 "0f8fd978dcb43662d57da8d4514e8c7ff60feb731599c0f8c145bf5d0ec2978d"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.65.2/netbird-ui_0.65.2_darwin_arm64_signed.zip"
      sha256 "67c93e4d2401ca24ce2dc1616ba105ef607e4791b81ca46a666081be5f804525"
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
