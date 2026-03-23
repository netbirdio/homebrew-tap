


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.67.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.67.0/netbird-ui_0.67.0_darwin_amd64_signed.zip"
      sha256 "aec18ff978862d890587efea802f106072143045622fe8b0e9ce98bcebe8fcb7"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.67.0/netbird-ui_0.67.0_darwin_arm64_signed.zip"
      sha256 "e3a72777901096f6d675f065930aeba7eb466de1fb3156f005693464bf7baf4f"
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
