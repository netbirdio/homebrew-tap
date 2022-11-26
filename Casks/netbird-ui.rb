


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.11.2"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.11.2/netbird-ui_0.11.2_darwin_amd64_signed.zip"
      sha256 "ddcb5f9d0d71a6b4d2ed57f1515eb8328624e7718282292be9ea5f65d15739da"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.11.2/netbird-ui_0.11.2_darwin_arm64_signed.zip"
      sha256 "b5ec98e8e549acf7f6c1d6e2cbf1608e61342c4ae9e2dbce3aa4aad378e25d0c"
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