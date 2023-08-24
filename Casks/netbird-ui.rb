


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.22.7"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.22.7/netbird-ui_0.22.7_darwin_amd64_signed.zip"
      sha256 "1e95657528146c109a2d9b72ef0ce2979d633e275307f03b726fe40ee0ea2839"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.22.7/netbird-ui_0.22.7_darwin_arm64_signed.zip"
      sha256 "b888f1b46b5a92e0b831dda75868b1b8f56cb1f97fbf22e32275c2628add7420"
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