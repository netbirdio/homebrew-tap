


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.8.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.8.1/netbird-ui_0.8.1_darwin_amd64_signed.zip"
      sha256 "5375b8bc5ef0e659adb215a56d865cfaa391ffb38a17cf27cb7ff51d31c69ae1"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.8.1/netbird-ui_0.8.1_darwin_arm64_signed.zip"
      sha256 "b61f566e8fc9b24fbdeda0336ca94d1c1aebb59ba85027202a55587ec62b1aff"
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