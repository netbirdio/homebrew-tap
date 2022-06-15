


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.7.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.7.0/netbird-ui_0.7.0_darwin_amd64_signed.zip"
      sha256 "0792a69120d6d3bbd82dad4e13eace8ea8f460dbea094f7eceb879c4d0d627d3"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.7.0/netbird-ui_0.7.0_darwin_arm64_signed.zip"
      sha256 "5248509d71691781ee1df1d66986185451a5946b0b6ccf8e2576abd0b338b558"
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