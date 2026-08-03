


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.76.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.76.1/netbird-ui_0.76.1_darwin_amd64_signed.zip"
      sha256 "5d04800bf5988c0db363dd5476845a6d896238afa1fce452478e9fdbcc29ee8b"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.76.1/netbird-ui_0.76.1_darwin_arm64_signed.zip"
      sha256 "221215239d11abe59df7944730aa9f15103e74ff9b9179440c9b7ee809c240ae"
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
    system_command "/bin/sh",
                   args: ["-c", <<~CMD],
                     launchctl bootout system/netbird 2>/dev/null || \
                       launchctl unload /Library/LaunchDaemons/netbird.plist 2>/dev/null || true
                     rm -f /Library/LaunchDaemons/netbird.plist
                   CMD
                   sudo: true
  end

  name "Netbird UI"
  desc "Netbird UI Client"
  homepage "https://www.netbird.io/"
end
