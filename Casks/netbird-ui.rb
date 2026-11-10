


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.82.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.82.1/netbird-ui_0.82.1_darwin_amd64_signed.zip"
      sha256 "4253db19181e4f37aeb2000dd6288f9aa351bc350fc126dfe4d44234dc9c0976"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.82.1/netbird-ui_0.82.1_darwin_arm64_signed.zip"
      sha256 "9cd57d6f42997f18fffff0b41dfd658bb5c3e9f5581dd46ab3d6d4706e956412"
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
