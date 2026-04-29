


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.70.2"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.70.2/netbird-ui_0.70.2_darwin_amd64_signed.zip"
      sha256 "5d08fb2ac041e14ee0298c2734a9eef90f887832bb88501d8ec0565e27fed54b"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.70.2/netbird-ui_0.70.2_darwin_arm64_signed.zip"
      sha256 "746d50d067b93ff819b79ace67135721e02418d2bc636df5d40b369d69f7e5d9"
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
