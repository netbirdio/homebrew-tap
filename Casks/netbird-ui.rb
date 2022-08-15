


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.8.7"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.8.7/netbird-ui_0.8.7_darwin_amd64_signed.zip"
      sha256 "268b2326244df67b6a4abe4e6f28c705932687856126d72848bc1bb726b05259"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.8.7/netbird-ui_0.8.7_darwin_arm64_signed.zip"
      sha256 "06e6bc07aa1744f7bc165246c44640ef875df7841f66103affe6dbd113bcf84c"
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