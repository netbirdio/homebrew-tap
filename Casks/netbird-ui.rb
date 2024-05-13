


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.27.6"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.27.6/netbird-ui_0.27.6_darwin_amd64_signed.zip"
      sha256 "5ef05bff96aa3986cb6a90d719b041b9a4b4a5b7653f32e2d0e435094363e1af"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.27.6/netbird-ui_0.27.6_darwin_arm64_signed.zip"
      sha256 "4bc298814f01ca6d4ab070609ebd16b2576807aa41794e64455ba9c07c8a7c75"
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