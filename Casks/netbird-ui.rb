


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.28.6"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.28.6/netbird-ui_0.28.6_darwin_amd64_signed.zip"
      sha256 "cc94b42d01bec92cde6e92ab2e2bfd0203b8d90a61a2a638af75c0ad0f408bb6"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.28.6/netbird-ui_0.28.6_darwin_arm64_signed.zip"
      sha256 "14f353370ddfc93113daa70ebdbea474bda687db49954c3e2b796ccb40d787fa"
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