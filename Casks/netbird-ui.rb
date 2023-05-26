


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.20.5"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.20.5/netbird-ui_0.20.5_darwin_amd64_signed.zip"
      sha256 "28eab5dc9fbde198eed465341d642d4a5ef4a6e61e378d8917722e13443258d1"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.20.5/netbird-ui_0.20.5_darwin_arm64_signed.zip"
      sha256 "ac6623d9d425bbbc2f1497157d3e76e50feb44ea868063953c71e5299f3e50b6"
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