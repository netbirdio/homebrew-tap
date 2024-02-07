


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.25.7"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.25.7/netbird-ui_0.25.7_darwin_amd64_signed.zip"
      sha256 "9f22b19de74bec6d3d64ba3e9e58fd5fea5aeb226171d7ab9fb6e5dc17a6e4f7"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.25.7/netbird-ui_0.25.7_darwin_arm64_signed.zip"
      sha256 "ff129821a234d7acc55d71d65c711b9eaddc0824646ec5b127581682a7c7c839"
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