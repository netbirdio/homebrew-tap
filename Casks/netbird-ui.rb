


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.21.3"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.21.3/netbird-ui_0.21.3_darwin_amd64_signed.zip"
      sha256 "a16e96b8bdbcd76a45fe5ce79a966243cfb6aa1f598ab6ae03fd16c610f6c53d"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.21.3/netbird-ui_0.21.3_darwin_arm64_signed.zip"
      sha256 "65026b89058c3c8d876179ac17dd2ea02b82128b478209f9534b5967701f4058"
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