


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.60.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.60.1/netbird-ui_0.60.1_darwin_amd64_signed.zip"
      sha256 "09c1c8a15e3022b82e39a429d856db3e959187fcec82ac43995204ada7e1fdc1"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.60.1/netbird-ui_0.60.1_darwin_arm64_signed.zip"
      sha256 "aaad55e00b2938d05cb27669a0bfb38fec760074a35f080d657393d8d54e204a"
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
