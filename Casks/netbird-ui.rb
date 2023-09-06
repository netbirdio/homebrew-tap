


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.23.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.23.0/netbird-ui_0.23.0_darwin_amd64_signed.zip"
      sha256 "1b0c9ef968dc817df4cc61ae078ec2f79bc153359c45a81b0882b84753eab7b6"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.23.0/netbird-ui_0.23.0_darwin_arm64_signed.zip"
      sha256 "2d0a2eddf8c2502766113dcc357579e8990877fae8ad7df19dbcf2c7d4036b5e"
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