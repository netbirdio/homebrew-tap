


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.70.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.70.1/netbird-ui_0.70.1_darwin_amd64_signed.zip"
      sha256 "2b302ce6c96d59abb00f7dc2f510a288f53f01f377b2dc9251c2b0c8c3ae3cb5"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.70.1/netbird-ui_0.70.1_darwin_arm64_signed.zip"
      sha256 "58468dd3aeaa312a620c1b08a52afcea6c3d0f08d46e363676484cb623361e01"
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
