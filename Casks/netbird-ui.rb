


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.33.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.33.0/netbird-ui_0.33.0_darwin_amd64_signed.zip"
      sha256 "1dfba772eb3f50dcc540fa599b6dcf9efa36994677bccf6e79ee2bc35819bcbb"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.33.0/netbird-ui_0.33.0_darwin_arm64_signed.zip"
      sha256 "18bf8f6f2a7ecf374aff3e351ca53275c049a5e32d8a689066116e5175bd667b"
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
