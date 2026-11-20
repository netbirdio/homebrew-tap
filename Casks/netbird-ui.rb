


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.83.2"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.83.2/netbird-ui_0.83.2_darwin_amd64_signed.zip"
      sha256 "416515998956764e18ce0ebe40fc685c5bef9e821523a05f6ab3f69b5392e5a5"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.83.2/netbird-ui_0.83.2_darwin_arm64_signed.zip"
      sha256 "e7b167d25f5981c5d981eadae54d4bbd1643b99759d8a94c91c353c48ffd04df"
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
