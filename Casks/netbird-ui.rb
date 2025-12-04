


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.60.6"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.60.6/netbird-ui_0.60.6_darwin_amd64_signed.zip"
      sha256 "25ab5cb418bb5700f8718bd5886c43f23d5b413ffc6f8a25578733c49b3a9278"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.60.6/netbird-ui_0.60.6_darwin_arm64_signed.zip"
      sha256 "22ecfea50a27666cb3a60a417d93f67f315284def1e39aed224bffae47ff7da6"
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
