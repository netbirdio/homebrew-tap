


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.51.2"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.51.2/netbird-ui_0.51.2_darwin_amd64_signed.zip"
      sha256 "69fd2f12949b090f24535b4eea7a365e0d828b44d61b6383022832d2dba7eeb9"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.51.2/netbird-ui_0.51.2_darwin_arm64_signed.zip"
      sha256 "a00fcd09b451819ab732cab4561356ccf5f61eca2e05f7cacc6b795703a1b16c"
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
