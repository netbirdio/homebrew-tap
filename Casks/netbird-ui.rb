


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.9.6"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.9.6/netbird-ui_0.9.6_darwin_amd64_signed.zip"
      sha256 "adca33563ec2cfda9568f1eaa480254ebe7e5e495eee73319c2e7267a7804278"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.9.6/netbird-ui_0.9.6_darwin_arm64_signed.zip"
      sha256 "0d61d2a0cedd2554b28218e93c4c0828fcf5bdc74e0499bb942477d175ae723a"
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