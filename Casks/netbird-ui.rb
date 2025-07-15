


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.51.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.51.0/netbird-ui_0.51.0_darwin_amd64_signed.zip"
      sha256 "ba0c543d7440d46b2e934529471ae069f586bb999865fb17f6884f56f49d5a9a"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.51.0/netbird-ui_0.51.0_darwin_arm64_signed.zip"
      sha256 "f544e73cbf55ff4de0e77d5775d08cf19b17f668160cd41bb654872fb9da650a"
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
