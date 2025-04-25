


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.43.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.43.0/netbird-ui_0.43.0_darwin_amd64_signed.zip"
      sha256 "5d37df758fb15a856059fe8c2bfed6b84e25ed0fe097c62d234eb288f3a7fee8"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.43.0/netbird-ui_0.43.0_darwin_arm64_signed.zip"
      sha256 "6822584c3d38dcc55453a84cf88d1362c12085a7e79e0a3ab5eea5b264fec8a3"
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
