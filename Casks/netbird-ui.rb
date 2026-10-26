


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.81.5"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.81.5/netbird-ui_0.81.5_darwin_amd64_signed.zip"
      sha256 "2efe2ff1546473ea17a3d82a20ac990762733414bce3aab1beef66cf23c40683"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.81.5/netbird-ui_0.81.5_darwin_arm64_signed.zip"
      sha256 "ac05adecd6b1d1cc9ae2b072f4ec1f0cdfe66fc4837c746960f5a15fc39b4f73"
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
