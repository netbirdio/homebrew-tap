


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.75.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.75.1/netbird-ui_0.75.1_darwin_amd64_signed.zip"
      sha256 "65f1a90394350f4867551295ebce526d7a8d7698d86cb33922d6a9a830cb31cb"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.75.1/netbird-ui_0.75.1_darwin_arm64_signed.zip"
      sha256 "975188ced8b5d0c214bd9352be9a7318480986f9af3596c75f4e8a1e3932d44b"
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
