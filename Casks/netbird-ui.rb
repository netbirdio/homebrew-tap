


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.28.4"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.28.4/netbird-ui_0.28.4_darwin_amd64_signed.zip"
      sha256 "97616201b9f5c107e7621e72ad3981416b8cf71cd80cf092083fcab5c090876d"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.28.4/netbird-ui_0.28.4_darwin_arm64_signed.zip"
      sha256 "38345dd516c162d6d08c607f5a873674928c94866e3695b988191ea292ce299a"
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