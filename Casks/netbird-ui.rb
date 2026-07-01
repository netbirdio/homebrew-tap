


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.74.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.74.0/netbird-ui_0.74.0_darwin_amd64_signed.zip"
      sha256 "b9c749ec8a2fc0d342fe3d95b5b78811d7f63be7fccfe84a0c6796ba8fe8546e"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.74.0/netbird-ui_0.74.0_darwin_arm64_signed.zip"
      sha256 "b4e8f72411ee9c5fdf426de46e1aeac87b188f59a810d790f53ba65a704166b5"
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
