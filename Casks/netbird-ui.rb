


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.24.3"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.24.3/netbird-ui_0.24.3_darwin_amd64_signed.zip"
      sha256 "3cb774ef8f55ae93ffa05d1109d4aa5381a6a2f182e6ee15e156991e288a24d7"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.24.3/netbird-ui_0.24.3_darwin_arm64_signed.zip"
      sha256 "e642c4448d5ad3e3c851ba2e8bc19f9d9c5101509f05d30bdd3a9f1eb81047b4"
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