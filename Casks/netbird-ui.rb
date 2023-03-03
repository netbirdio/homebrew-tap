


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.14.2"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.14.2/netbird-ui_0.14.2_darwin_amd64_signed.zip"
      sha256 "fa44fd54f82053f6ce483f3be5c82d3f1e16020b41a2ea88fe8a76c7f4a7befe"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.14.2/netbird-ui_0.14.2_darwin_arm64_signed.zip"
      sha256 "40e6b9b347528027b94584ec6f3afee52a938bde1ef23e732ad8922c929e422b"
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