


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.59.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.59.1/netbird-ui_0.59.1_darwin_amd64_signed.zip"
      sha256 "12fc06e9b78d9f0f10352389ee4133641ade477d73b15b78ec4220d7cf10388a"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.59.1/netbird-ui_0.59.1_darwin_arm64_signed.zip"
      sha256 "db45939ee27dfa76954b5d7e734067b719a6583e42fb476fd277fb7906a172ae"
      app "netbird_ui_darwin", target: "Netbird UI.app"
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
