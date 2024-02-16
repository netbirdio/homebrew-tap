


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.25.9"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.25.9/netbird-ui_0.25.9_darwin_amd64_signed.zip"
      sha256 "1ae1226df953848a3fdf68d087138a21078f830156ba93b65546ec0a5ada3810"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.25.9/netbird-ui_0.25.9_darwin_arm64_signed.zip"
      sha256 "903e35f0af1521717c0dc618624d7bb639d816c36cf5d79f97238ba648fb6f2d"
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