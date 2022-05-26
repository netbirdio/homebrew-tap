


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.6.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.6.0/netbird-ui_0.6.0_darwin_amd64_signed.zip"
      sha256 "709e6d113ef09dda4ce8eea0c70e61bcc150aecad848c73e860277de6d1f10c9"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.6.0/netbird-ui_0.6.0_darwin_arm64_signed.zip"
      sha256 "d2b5b770aef11197f1173731b509cd90a2107e4795cd45ab347209c023d88f13"
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