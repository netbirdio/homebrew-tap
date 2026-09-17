# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.78.2"

  on_arm do
    sha256 "36bf1481d04abed388dcf356462ac9f6ce60c56503bbf9058a30c0dcd693a864"

    url "https://github.com/netbirdio/netbird/releases/download/v#{version}/netbird-ui_#{version}_darwin_arm64_signed.zip"
  end
  on_intel do
    sha256 "2cea7b4c4e49a6f24a230f1b41a7bcb6f7368f7c3d52bd4271e62c9448154191"

    url "https://github.com/netbirdio/netbird/releases/download/v#{version}/netbird-ui_#{version}_darwin_amd64_signed.zip"
  end

  name "Netbird UI"
  desc "Client for the NetBird VPN"
  homepage "https://www.netbird.io/"

  depends_on formula: "netbird"
  depends_on :macos

  app "netbird_ui_darwin", target: "Netbird UI.app"

  postflight_steps do
    set_permissions "/Applications/Netbird UI.app/installer.sh", "0755"
    set_permissions "/Applications/Netbird UI.app/uninstaller.sh", "0755"
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
