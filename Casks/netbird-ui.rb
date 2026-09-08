


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.78.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.78.1/netbird-ui_0.78.1_darwin_amd64_signed.zip"
      sha256 "87085c31fa0c42217aad086f88ebbc70aa9a371c3cadc6bf992a20f94559e4ca"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.78.1/netbird-ui_0.78.1_darwin_arm64_signed.zip"
      sha256 "3ffa5f88dab9ffaf43e1016b5c8423d831d369b7ee339524f5f2256b940e50d1"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  end

  depends_on formula: "netbird"

  postflight_steps do
    set_permissions ["Netbird UI.app/installer.sh", "Netbird UI.app/uninstaller.sh"], "0755",
                    base: :appdir, recursive: false
    run "Netbird UI.app/installer.sh", args: ["#{version}"], base: :appdir, sudo: true
  end

  uninstall_preflight_steps do
    run "/bin/launchctl", args: ["bootout", "system/netbird"], sudo: true, must_succeed: false
    run "/bin/launchctl", args: ["unload", "/Library/LaunchDaemons/netbird.plist"],
        sudo: true, must_succeed: false
    remove "/Library/LaunchDaemons/netbird.plist", sudo: true
  end

  name "Netbird UI"
  desc "Netbird UI Client"
  homepage "https://www.netbird.io/"
end
