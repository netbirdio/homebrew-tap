


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.60.3"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.60.3/netbird-ui_0.60.3_darwin_amd64_signed.zip"
      sha256 "eac4b1d8165046e525a53321dcb6cb4b5a007c6d344c5bdc2296e74398fb55ea"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.60.3/netbird-ui_0.60.3_darwin_arm64_signed.zip"
      sha256 "19e38f2e85fdada1e67834a267f5e5a8ba73d3ff81b8364205c559bca9ff4a36"
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
