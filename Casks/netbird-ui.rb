


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.81.4"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.81.4/netbird-ui_0.81.4_darwin_amd64_signed.zip"
      sha256 "002a1c941e85eaa20ec16b248d4ec57c589d4b8ae9b8b820262bfb8583d1a199"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.81.4/netbird-ui_0.81.4_darwin_arm64_signed.zip"
      sha256 "3dc73abf12967f15f82f4c380252af5ae573b06b605dc00f30a0c293eaace55b"
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
