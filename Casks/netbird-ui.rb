


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.81.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.81.1/netbird-ui_0.81.1_darwin_amd64_signed.zip"
      sha256 "78b57472a702c1b128a993fa0f92d43f2e2c8444d11c33e8ab8589ae32353a7b"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.81.1/netbird-ui_0.81.1_darwin_arm64_signed.zip"
      sha256 "2f7072189ddf170805d66f2e3998e4ba8a542dcab79e96e04e1437dde75ebd15"
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
