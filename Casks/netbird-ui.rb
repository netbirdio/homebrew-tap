


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.10.7"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.10.7/netbird-ui_0.10.7_darwin_amd64_signed.zip"
      sha256 "05149ddbbb2dae43dd110ffcba17ede023b4c153dc9b726611fc9dd207a7f8c3"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.10.7/netbird-ui_0.10.7_darwin_arm64_signed.zip"
      sha256 "6fc1cf38298c2ecf3564ce8a4e37b6de62f6aed0473b6f010471d6dcb988dafc"
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