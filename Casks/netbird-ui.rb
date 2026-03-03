


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.66.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.66.1/netbird-ui_0.66.1_darwin_amd64_signed.zip"
      sha256 "7340563c84c6324c9f9732a4fb3a00179f9cd934b7c99a08d52a375e3b48a349"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.66.1/netbird-ui_0.66.1_darwin_arm64_signed.zip"
      sha256 "b696fe6659bf89f548bac78f9c107625704cfb385ace72e2a04aab4133247d41"
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
