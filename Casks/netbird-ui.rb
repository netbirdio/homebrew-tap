


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.59.7"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.59.7/netbird-ui_0.59.7_darwin_amd64_signed.zip"
      sha256 "5911786f8e952f3614c80e40599f3e9f069d0e1f67508bb5086ac968926f1d08"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.59.7/netbird-ui_0.59.7_darwin_arm64_signed.zip"
      sha256 "e4e2fa14e8040871978cf27d96ab63245457e42599611a2278fba7435c60356a"
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
