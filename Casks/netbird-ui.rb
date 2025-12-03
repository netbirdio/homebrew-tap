


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.60.5"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.60.5/netbird-ui_0.60.5_darwin_amd64_signed.zip"
      sha256 "524f1e0edf218ebfd374fa226fc008d022de0924c549d00cff58106eeec69162"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.60.5/netbird-ui_0.60.5_darwin_arm64_signed.zip"
      sha256 "f719f452a1dbfdda2db9d9f96b83a5f37817befd495a3bfe75c24dc66bba5e28"
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
