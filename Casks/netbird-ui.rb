


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.81.2"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.81.2/netbird-ui_0.81.2_darwin_amd64_signed.zip"
      sha256 "8f4d8c8493c59112b47779e0831e18eb5d614d9afe1027d7cb240ffb0e28122c"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.81.2/netbird-ui_0.81.2_darwin_arm64_signed.zip"
      sha256 "c6ae0c46b8b31974d2aecf31d7d9fa6cd15c77400527b49d1e0e936f2be95ade"
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
