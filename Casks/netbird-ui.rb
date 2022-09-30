


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.9.7"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.9.7/netbird-ui_0.9.7_darwin_amd64_signed.zip"
      sha256 "b1aeee7e0a5735af329cf3dc36c3aed9cc6e1160d79eef1ee002e562137d4ba6"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.9.7/netbird-ui_0.9.7_darwin_arm64_signed.zip"
      sha256 "d269d6c5dc0f591c2066ce73bc07cb4d23e3deb83397f4ddc72561da0812097c"
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