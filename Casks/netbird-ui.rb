


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.41.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.41.1/netbird-ui_0.41.1_darwin_amd64_signed.zip"
      sha256 "38b8bd2a9906188b568f2b03a0a5eb7eb1beb04e897e9cb4241a4b4d4bff96cd"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.41.1/netbird-ui_0.41.1_darwin_arm64_signed.zip"
      sha256 "6d6020c9cb59db8cb29ad41c7d41c5f72967063f392ae96402d9b35b64170a2b"
      app "netbird_ui_darwin", target: "Netbird UI.app"
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
