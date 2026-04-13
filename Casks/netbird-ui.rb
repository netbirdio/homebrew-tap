


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.68.2"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.68.2/netbird-ui_0.68.2_darwin_amd64_signed.zip"
      sha256 "49e44bb2483ee820ebb6a62229c84311f1610956c44bb82c7cf3421bf36ea0fe"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.68.2/netbird-ui_0.68.2_darwin_arm64_signed.zip"
      sha256 "5acd78e723b0ae59474492c501a02d9a36aeb89da532587d056efd7de7c00f4a"
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
