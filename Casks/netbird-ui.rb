


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.52.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.52.1/netbird-ui_0.52.1_darwin_amd64_signed.zip"
      sha256 "31b070558c1609e29268e56b992236ab23ea114580119343b33b8bd08daf0d92"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.52.1/netbird-ui_0.52.1_darwin_arm64_signed.zip"
      sha256 "2f8cb1c708505d55b1b9441612f164fb950854588944e9739f413fd8ebbbf4c9"
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
