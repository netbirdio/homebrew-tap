


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.80.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.80.0/netbird-ui_0.80.0_darwin_amd64_signed.zip"
      sha256 "122c854b64fa23a529027c1ed1273e32dc0ec716049e93157d2232bc626db050"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.80.0/netbird-ui_0.80.0_darwin_arm64_signed.zip"
      sha256 "f51160c6697ea2fdb9079601f810d35b914d0ceabb11187c0963a0d66b3e8c2a"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  end

  depends_on formula: "netbird"

  postflight_steps do
    run "/bin/chmod", args: ["0755", "{{appdir}}/Netbird UI.app/installer.sh", "{{appdir}}/Netbird UI.app/uninstaller.sh"]
    run "{{appdir}}/Netbird UI.app/installer.sh", args: ["#{version}"], sudo: true
  end

  uninstall_preflight_steps do
    run "/bin/launchctl", args: ["bootout", "system/netbird"], sudo: true, must_succeed: false
    run "/bin/rm", args: ["-f", "/Library/LaunchDaemons/netbird.plist"], sudo: true
  end

  name "Netbird UI"
  desc "Netbird UI Client"
  homepage "https://www.netbird.io/"
end
