


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.9.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.9.1/netbird-ui_0.9.1_darwin_amd64_signed.zip"
      sha256 "af24062b2725d39ac0989e0797501745e4711f9b85fc46c08dcc27edf9a264f9"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.9.1/netbird-ui_0.9.1_darwin_arm64_signed.zip"
      sha256 "4c28d04f2df21a5e71eb3d82015e4378db96dc769b974391b42f41513889ff1e"
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