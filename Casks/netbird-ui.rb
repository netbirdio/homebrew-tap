


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.68.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.68.1/netbird-ui_0.68.1_darwin_amd64_signed.zip"
      sha256 "318837c40b9d6e18f01459f2a9363f62980da43b51fd6acfc2a1c1315a49bdb0"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.68.1/netbird-ui_0.68.1_darwin_arm64_signed.zip"
      sha256 "6392d4a372f8bca22c13ecf785893e057d9e5d482d31c0715b6d408c545ae56d"
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
