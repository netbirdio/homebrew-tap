


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.83.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.83.1/netbird-ui_0.83.1_darwin_amd64_signed.zip"
      sha256 "78c0af998b54b96f5cac3e2dc78e3ebfe1e8d59062a1587fd8224d9aae006c27"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.83.1/netbird-ui_0.83.1_darwin_arm64_signed.zip"
      sha256 "0c2ca84ae0b7552a44663899988c9c9883141052f26af6e54e5baf790a7b3dd3"
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
