# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.79.0"

  on_arm do
    sha256 "67634168798522fd22eefbc1c84e4daece7bae75332535e3ffc1f7aef58ab98a"

    url "https://github.com/netbirdio/netbird/releases/download/v#{version}/netbird-ui_#{version}_darwin_arm64_signed.zip"
  end
  on_intel do
    sha256 "d525ce11f16ce74a98b6b378f4ee697d24be447e10f07728db19cff997d92fd8"

    url "https://github.com/netbirdio/netbird/releases/download/v#{version}/netbird-ui_#{version}_darwin_amd64_signed.zip"
  end

  name "Netbird UI"
  desc "Client for the NetBird VPN"
  homepage "https://www.netbird.io/"

  depends_on formula: "netbird"
  depends_on :macos

  app "netbird_ui_darwin", target: "Netbird UI.app"

  postflight_steps do
    set_permissions "Netbird UI.app/installer.sh", "0755", base: :appdir
    set_permissions "Netbird UI.app/uninstaller.sh", "0755", base: :appdir
    run "{{appdir}}/Netbird UI.app/installer.sh",
        args: ["{{version}}"],
        sudo: true
  end

  uninstall_preflight_steps do
    run "/bin/sh",
        args: ["-c", <<~CMD],
          launchctl bootout system/netbird 2>/dev/null || \
            launchctl unload /Library/LaunchDaemons/netbird.plist 2>/dev/null || true
          rm -f /Library/LaunchDaemons/netbird.plist
        CMD
        sudo: true
  end
end
