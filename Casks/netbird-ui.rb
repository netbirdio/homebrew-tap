


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.51.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.51.1/netbird-ui_0.51.1_darwin_amd64_signed.zip"
      sha256 "1caabb35e53a3cac1f31ad64994058f4ceacee6d3a87e2e8415d363cf68dd77d"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.51.1/netbird-ui_0.51.1_darwin_arm64_signed.zip"
      sha256 "e22a2210676cb4a7d7c1d5c8cacb81b9bf52555548cdf50d5f93e40870d9aace"
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
