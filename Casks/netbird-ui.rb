


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.24.2"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.24.2/netbird-ui_0.24.2_darwin_amd64_signed.zip"
      sha256 "b7194d65e2a79b1408237c707e361f07c2d054301a35fc4a20cb89aeec17dc62"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.24.2/netbird-ui_0.24.2_darwin_arm64_signed.zip"
      sha256 "bb7fb935ced419f8094f5f3e546a0b124b599e99f2066403527366b68f7024b2"
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