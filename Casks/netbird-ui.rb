


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.84.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.84.0/netbird-ui_0.84.0_darwin_amd64_signed.zip"
      sha256 "6bb58e314fa8aacee6ffab60621da1c185bfd3d82f9954ff105c7bc88516281b"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.84.0/netbird-ui_0.84.0_darwin_arm64_signed.zip"
      sha256 "6b220fb42a00a09c1172acda3f78f21030b8de98710ef576601b07f06e6dbaf5"
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
