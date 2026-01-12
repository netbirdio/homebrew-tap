


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.62.3"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.62.3/netbird-ui_0.62.3_darwin_amd64_signed.zip"
      sha256 "2621f59f27a8bd62aa8c1f974c0233e4faa594718158ed381425cc4f8c96eb91"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.62.3/netbird-ui_0.62.3_darwin_arm64_signed.zip"
      sha256 "9368ab71bd7decf582c67c50f0af9690e4e5434973fcd3f89baf4e87daf908d0"
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
