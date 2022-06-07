


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.6.4"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.6.4/netbird-ui_0.6.4_darwin_amd64_signed.zip"
      sha256 "fe4cf46cb8c3aac76439259ca1db5e9c61e75b7596231f5601015f9739b0fcb9"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.6.4/netbird-ui_0.6.4_darwin_arm64_signed.zip"
      sha256 "c1c9924657eac11175654f70525e605904f98c44685b048adf9d62a96c53f022"
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