


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.52.2"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.52.2/netbird-ui_0.52.2_darwin_amd64_signed.zip"
      sha256 "5569f3b00aeda058b941d39921d28c81a4c308f9790bf746ea56c736b98d60d8"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.52.2/netbird-ui_0.52.2_darwin_arm64_signed.zip"
      sha256 "d9600a0d0d54f3dd32891e88b12836faae1ba9a8da8005d592ff15080f93a11d"
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
