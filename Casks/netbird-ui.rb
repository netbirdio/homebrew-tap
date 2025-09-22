


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.58.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.58.1/netbird-ui_0.58.1_darwin_amd64_signed.zip"
      sha256 "bd53d70b95df959401fcb15febd57d70e11235ed46ce3730b8f19d85a56c42e8"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.58.1/netbird-ui_0.58.1_darwin_arm64_signed.zip"
      sha256 "21d8286b5bfa170eaa169ffc346703005c08609cbc3fcd462c912a44b1eb2c80"
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
