


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.45.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.45.0/netbird-ui_0.45.0_darwin_amd64_signed.zip"
      sha256 "e0d47a4b583a812bfe3de5dfaed607c5209833d40303fcab05d68debaa6d8c88"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.45.0/netbird-ui_0.45.0_darwin_arm64_signed.zip"
      sha256 "a955a3110a2ee3033eaa8b5d12af16fd041f71354430dfff2ea563b8343e3ec1"
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
