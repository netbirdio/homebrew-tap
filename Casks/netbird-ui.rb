


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.66.2"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.66.2/netbird-ui_0.66.2_darwin_amd64_signed.zip"
      sha256 "1820bbe2bbe9dedc739360738213def3dcc5738c77739666f9026a8c5688ebc0"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.66.2/netbird-ui_0.66.2_darwin_arm64_signed.zip"
      sha256 "a27e13a463a4a566898541358768212da452cdf7498a8eb25bee898ee59746bc"
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
