


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.30.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.30.0/netbird-ui_0.30.0_darwin_amd64_signed.zip"
      sha256 "321ca63b75ca4702e018eb743666a95d4eb7cb0df7ca07d4a195f1a389db5e64"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.30.0/netbird-ui_0.30.0_darwin_arm64_signed.zip"
      sha256 "9b3d3349c79cd583eae87bcd6f3d9169962dddfb13a264aa68501b687d192e3c"
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