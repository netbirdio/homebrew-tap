


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.74.5"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.74.5/netbird-ui_0.74.5_darwin_amd64_signed.zip"
      sha256 "8846a643fb4471a3642e38b581f59812e257f71de9d5a85dd704f38623b37258"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.74.5/netbird-ui_0.74.5_darwin_arm64_signed.zip"
      sha256 "dbb80c666086999c14cafd6fb59dce7f2d0af3befb3cd55b55ddc3ecf02cdbbc"
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
