


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.21.4"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.21.4/netbird-ui_0.21.4_darwin_amd64_signed.zip"
      sha256 "750c351925e3a21d1aa728b657e9942a62bbb5c07bafe35af2fc62933f92117d"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.21.4/netbird-ui_0.21.4_darwin_arm64_signed.zip"
      sha256 "2b9aa41d3a0c402956d019576d8686537f86ef31fdae77f175b694c2ea06d749"
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