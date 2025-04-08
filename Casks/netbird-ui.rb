


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.40.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.40.0/netbird-ui_0.40.0_darwin_amd64_signed.zip"
      sha256 "f7d015ff745a7461bed699d0b8cf7a7653eb55a5b0efbfb9c24956e6dbf2a54f"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.40.0/netbird-ui_0.40.0_darwin_arm64_signed.zip"
      sha256 "a8ecca6995b37e90664f1f65fa7cd8a856569e346232e9010758316059d3f2bf"
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
