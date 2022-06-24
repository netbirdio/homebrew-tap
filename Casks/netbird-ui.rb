


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.8.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.8.0/netbird-ui_0.8.0_darwin_amd64_signed.zip"
      sha256 "2254a40a1ee83b38845b23e20d519e5810a256176881c66322e3b458d91b083a"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.8.0/netbird-ui_0.8.0_darwin_arm64_signed.zip"
      sha256 "789b2cfd1c19af1b85009d5d3167776792d1456e2329535c41dbbfd6597e53dc"
      app "netbird_ui_darwin_arm64", target: "Netbird UI.app"
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