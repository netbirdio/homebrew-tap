


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.26.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.26.1/netbird-ui_0.26.1_darwin_amd64_signed.zip"
      sha256 "f88bda6ea7986b52f41cb937bea43b2e19b9594fc3012d36097b05e9b0da6db6"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.26.1/netbird-ui_0.26.1_darwin_arm64_signed.zip"
      sha256 "e9476c543d4a8f8582ec95b5d3fd703bcc78c08d51a0020d228cf1ecfa45ddc1"
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