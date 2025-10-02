


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.59.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.59.1/netbird-ui_0.59.1_darwin_amd64_signed.zip"
      sha256 "0ffec0f3665ff7b318f6b8b3499d8fedd82871ec7a8b9e518e59ae2650f5ac4b"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.59.1/netbird-ui_0.59.1_darwin_arm64_signed.zip"
      sha256 "83ca87129c83b47873c3d29734f801d6fc93457383d2085220c3cc3a4aa6ddaa"
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
