


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.79.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.79.0/netbird-ui_0.79.0_darwin_amd64_signed.zip"
      sha256 "d525ce11f16ce74a98b6b378f4ee697d24be447e10f07728db19cff997d92fd8"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.79.0/netbird-ui_0.79.0_darwin_arm64_signed.zip"
      sha256 "67634168798522fd22eefbc1c84e4daece7bae75332535e3ffc1f7aef58ab98a"
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
