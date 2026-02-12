


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.64.6"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.64.6/netbird-ui_0.64.6_darwin_amd64_signed.zip"
      sha256 "789166554ec8a9ecb93e9e1f2e69a33857510e55012cd97c2e81ff84ba9908b1"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.64.6/netbird-ui_0.64.6_darwin_arm64_signed.zip"
      sha256 "4f11873312f8b58aaa9eb7f53178e33ac9a6cb994183e93764cd190b68ab2d98"
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
