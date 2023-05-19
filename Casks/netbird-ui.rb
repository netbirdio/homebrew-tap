


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.20.3"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.20.3/netbird-ui_0.20.3_darwin_amd64_signed.zip"
      sha256 "d8a2b66c51056c3a31682b5c602f82234edfc453baf9426ae00458bd76ddc464"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.20.3/netbird-ui_0.20.3_darwin_arm64_signed.zip"
      sha256 "25a29b0acf49a7078b65287283f309eb0e4079683db4076122d5990cb08a3c91"
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