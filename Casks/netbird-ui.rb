


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.67.4"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.67.4/netbird-ui_0.67.4_darwin_amd64_signed.zip"
      sha256 "be69188ff809a71ded79dcb9d4f9185e5cd89fd094e8321ab097045e6e042c85"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.67.4/netbird-ui_0.67.4_darwin_arm64_signed.zip"
      sha256 "4d790a0041c0bb5beb3af511c0303030f164992b84f8ea77fde9f15f8d9b3b8b"
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
