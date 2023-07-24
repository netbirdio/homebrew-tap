


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.21.11"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.21.11/netbird-ui_0.21.11_darwin_amd64_signed.zip"
      sha256 "a47fb54e4133a24b580ed331c2148b2dbd696ee4831729fe709f632bf4a3991d"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.21.11/netbird-ui_0.21.11_darwin_arm64_signed.zip"
      sha256 "329f393e8466114db9c721a2aad75199d8c4af1e91f78ef729dc50d5f047b33a"
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