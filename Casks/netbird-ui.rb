


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.68.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.68.1/netbird-ui_0.68.1_darwin_amd64_signed.zip"
      sha256 "08dc03e2813bfe24ee8a44caae07656c1c7b375fe009e66fc020d97cec728833"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.68.1/netbird-ui_0.68.1_darwin_arm64_signed.zip"
      sha256 "04e793098edf9702f01f038c74d089dc0bd3101f915299eed4804d759eb4717b"
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
