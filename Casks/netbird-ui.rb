


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.20.7"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.20.7/netbird-ui_0.20.7_darwin_amd64_signed.zip"
      sha256 "04fb5410c033736debc643d6e746e5224f806b53cabb923da0d337c6bb55b2c4"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.20.7/netbird-ui_0.20.7_darwin_arm64_signed.zip"
      sha256 "1c42f29d4105d565e7b1c9b3a704ce0c937fdbc102b34efde11570be526b0bb8"
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