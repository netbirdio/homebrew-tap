


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.36.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.36.0/netbird-ui_0.36.0_darwin_amd64_signed.zip"
      sha256 "4fa09baabe3d5cf1bc10cf11301e4d1089984af04c2f959090c3ce5e1f42e901"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.36.0/netbird-ui_0.36.0_darwin_arm64_signed.zip"
      sha256 "72b00bb723a2d9fd198a48a2703703a7bb7a81cb0fe42f00ef0497cc1c371328"
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
