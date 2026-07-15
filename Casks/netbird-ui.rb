


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.74.6"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.74.6/netbird-ui_0.74.6_darwin_amd64_signed.zip"
      sha256 "357a1c4b261221fa631b27a3fea76fc2888db6c84d8e4224965fadf116c9a142"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.74.6/netbird-ui_0.74.6_darwin_arm64_signed.zip"
      sha256 "6f50a4e6d60ccc305ab8acb92fafdf0fbf5a31bc454f7a2034bfd24178eb1450"
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
