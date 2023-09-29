


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.23.6"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.23.6/netbird-ui_0.23.6_darwin_amd64_signed.zip"
      sha256 "99000a0f0a16efda3213d235f2722b954de7e78914c4d3cfd34c990794e279e6"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.23.6/netbird-ui_0.23.6_darwin_arm64_signed.zip"
      sha256 "77667536163388b6bf716646db8e8e79ca5807d425c9cf4ea2a695378e2f88dd"
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