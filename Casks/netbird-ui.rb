


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.64.4"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.64.4/netbird-ui_0.64.4_darwin_amd64_signed.zip"
      sha256 "5d951654007b4cab581c5ee7f366f5c116b01324656bf5ae466f3412a9b37ff1"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.64.4/netbird-ui_0.64.4_darwin_arm64_signed.zip"
      sha256 "816f67948d87946e476edba648c28d378ab3a6925324f6c901b469b883863bb3"
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
