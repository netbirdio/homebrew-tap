


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.64.3"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.64.3/netbird-ui_0.64.3_darwin_amd64_signed.zip"
      sha256 "52300b5d819e6fa53833f02d35031677e3ae4b752fdd2c4a8c8e2389b031c464"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.64.3/netbird-ui_0.64.3_darwin_arm64_signed.zip"
      sha256 "0caa7e493f427a14085686016c9ce92430351e199cdae4b606c229b9ce23983a"
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
