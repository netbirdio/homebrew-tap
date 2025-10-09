


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.59.5"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.59.5/netbird-ui_0.59.5_darwin_amd64_signed.zip"
      sha256 "22410cc2d435bf6a9c58e78d565169b37d354488ad6c9b090b5bb59de399037b"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.59.5/netbird-ui_0.59.5_darwin_arm64_signed.zip"
      sha256 "d378085ecda5464cf099bf5cc2fc0036e356c93953707520530ef40a929ae10c"
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
