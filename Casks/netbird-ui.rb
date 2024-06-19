


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.28.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.28.0/netbird-ui_0.28.0_darwin_amd64_signed.zip"
      sha256 "38dd81096b56e550039166ce101e5cce314d5f499fd9c9250e6b8f34238a2de7"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.28.0/netbird-ui_0.28.0_darwin_arm64_signed.zip"
      sha256 "44a2931ef1b4008e2294dd51893f5751e955b137f2f2b7f41fa74405b4685f55"
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