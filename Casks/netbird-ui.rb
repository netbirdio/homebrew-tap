


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.82.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.82.0/netbird-ui_0.82.0_darwin_amd64_signed.zip"
      sha256 "34cb2589672d46f969817dc9c9b886cd6ddda0c8083f18b4a4b3e1c2e48ae498"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.82.0/netbird-ui_0.82.0_darwin_arm64_signed.zip"
      sha256 "919cbb6abdfa90d52b19b9412581313f97daddd0129fac1a5c8a0c4a28d40c86"
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
