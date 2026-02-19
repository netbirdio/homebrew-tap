


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.65.3"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.65.3/netbird-ui_0.65.3_darwin_amd64_signed.zip"
      sha256 "354d8144b2ae0d361c9bd1d66c8a60503693fed458236701580a7b37fb9edd07"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.65.3/netbird-ui_0.65.3_darwin_arm64_signed.zip"
      sha256 "16de5295aed29258538ea650c42b904aafbf0f60b8404ef931ff8a5d05dc5ed6"
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
