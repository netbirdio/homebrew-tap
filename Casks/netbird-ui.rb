


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.8.9"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.8.9/netbird-ui_0.8.9_darwin_amd64_signed.zip"
      sha256 "c3428f5c4d627614a022b41654a82de6c09347cb9e7a4c4986b936d04c020683"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.8.9/netbird-ui_0.8.9_darwin_arm64_signed.zip"
      sha256 "04326c7d73167c8b0bf963aa5777f7bc5f10a35857768293fc32f1be630b3429"
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