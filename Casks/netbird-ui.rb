


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.27.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.27.0/netbird-ui_0.27.0_darwin_amd64_signed.zip"
      sha256 "58a90ef3cca47f73b81e9bebce6014644f0280f0fc6c2b25bca58801deb11346"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.27.0/netbird-ui_0.27.0_darwin_arm64_signed.zip"
      sha256 "c890d662f686f885010728700e9daf7c11fab5b8b05e0369dcf0212491a5d63c"
      app "netbird_ui_darwin_arm64", target: "Netbird UI.app"
  end

  depends_on formula: "netbird"

  postflight do
    set_permissions "/Applications/Netbird UI.app/installer.sh", '0755'
    set_permissions "/Applications/Netbird UI.app/uninstaller.sh", '0755'
  end

  postflight do
    system_command "#{appdir}/Netbird UI.app/installer.sh",
                   args: ["#{version}"],
                   sudo: true
  end

  uninstall_preflight do
    system_command "#{appdir}/Netbird UI.app/uninstaller.sh",
                   sudo: false
  end

  name "Netbird UI"
  desc "Netbird UI Client"
  homepage "https://www.netbird.io/"
end