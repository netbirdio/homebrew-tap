


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.23.7"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.23.7/netbird-ui_0.23.7_darwin_amd64_signed.zip"
      sha256 "ecd5640142514097fa57c3c66a63078282b4940098459884354035658f1ad9d0"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.23.7/netbird-ui_0.23.7_darwin_arm64_signed.zip"
      sha256 "e48f8405d819401c6b64f1ce084858b6d2e233069903b9c14e22156b85034fb1"
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