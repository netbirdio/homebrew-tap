


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.15.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.15.1/netbird-ui_0.15.1_darwin_amd64_signed.zip"
      sha256 "b8dee5972abd7b78738f1eaf362460107b0185ec7595c71fbc8d8f1aa93323e6"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.15.1/netbird-ui_0.15.1_darwin_arm64_signed.zip"
      sha256 "35306fc6b456190c12b3dd1a15a366ee4443b4885e61cf7a6c556d1385eca9f8"
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