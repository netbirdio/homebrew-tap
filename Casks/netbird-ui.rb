


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.11.6"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.11.6/netbird-ui_0.11.6_darwin_amd64_signed.zip"
      sha256 "05f49d792dcdc2a935089e78a44048acf2613f433fb710b3ad9b32085f3b9a22"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.11.6/netbird-ui_0.11.6_darwin_arm64_signed.zip"
      sha256 "9b61cb5efd9c191c3b2ac49401f92a7625c11107f0c34d510729a99b0197a8e3"
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