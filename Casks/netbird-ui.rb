


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.28.2"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.28.2/netbird-ui_0.28.2_darwin_amd64_signed.zip"
      sha256 "f67f1998e3b65a0688edf998370549869a3c9d8f79f03cdaf337d0633ff14ebf"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.28.2/netbird-ui_0.28.2_darwin_arm64_signed.zip"
      sha256 "cab9308bf056106f4de5329e6f77b56a31345ce611d78d83c02a19a8d6c2b4ed"
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