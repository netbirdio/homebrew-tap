


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.20.7"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.20.7/netbird-ui_0.20.7_darwin_amd64_signed.zip"
      sha256 "a9a917c4b59c9cb3e70133026262f30af6bc0dfd347f101da35f5fa2c368c1c8"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.20.7/netbird-ui_0.20.7_darwin_arm64_signed.zip"
      sha256 "1aa2456d6be74297364603af6eafb5a018b8c11f9f886a60b5fb9bedd767ff2e"
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