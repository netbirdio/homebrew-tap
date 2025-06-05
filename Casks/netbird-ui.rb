


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.46.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.46.0/netbird-ui_0.46.0_darwin_amd64_signed.zip"
      sha256 "8628642885079e750b2b539ff5eeeb4ffd406962612ccf40fa51ec7595ea788a"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.46.0/netbird-ui_0.46.0_darwin_arm64_signed.zip"
      sha256 "ba6c5178a504e3e7c55f4df0817494e43431c97dfbcd5198470408e8d4377ef4"
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
