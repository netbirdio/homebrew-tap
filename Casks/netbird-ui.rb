


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.81.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.81.0/netbird-ui_0.81.0_darwin_amd64_signed.zip"
      sha256 "2c930859ecaa3bddcb922275a4a5f804037f8c3e3c330759fe4df0dd5cc15941"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.81.0/netbird-ui_0.81.0_darwin_arm64_signed.zip"
      sha256 "f61fa9f42b301a805fe709de06c9bf5be3b9632518e05592dd3dcd991955df7f"
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
