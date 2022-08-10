


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.8.6"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.8.6/netbird-ui_0.8.6_darwin_amd64_signed.zip"
      sha256 "fbd563e5b0f0611c98d72a0ec6b5d04152a7a0d140503a7d8db1a659a4befa19"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.8.6/netbird-ui_0.8.6_darwin_arm64_signed.zip"
      sha256 "776abcb90cfc33909efd5593b726de343725a1606505dba81c899f9c7aeab049"
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