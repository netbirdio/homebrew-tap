


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.59.12"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.59.12/netbird-ui_0.59.12_darwin_amd64_signed.zip"
      sha256 "f1551d8277ff7ac18b3c3ffa428555b65e91eb8c037195fbff83d7ed4449d891"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.59.12/netbird-ui_0.59.12_darwin_arm64_signed.zip"
      sha256 "7550e63a1ff571b4ee47bacd98a51fa1fc1e4a52467e97c711ff7abe8499f9d6"
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
