


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.37.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.37.0/netbird-ui_0.37.0_darwin_amd64_signed.zip"
      sha256 "bfcc0c73ca7f296f1c63d542c36e83f59cffc6010f52b60ea60b675f40c99c40"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.37.0/netbird-ui_0.37.0_darwin_arm64_signed.zip"
      sha256 "8abdb77a34e2660dc75df2b24cae749f9e181120d52cef240935a70c1770b82d"
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
