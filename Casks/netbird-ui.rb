


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.21.8"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.21.8/netbird-ui_0.21.8_darwin_amd64_signed.zip"
      sha256 "4e18e01a9ae35aa5614a64062f7a23451b4b34baab5753ceb089715ee106c0e6"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.21.8/netbird-ui_0.21.8_darwin_arm64_signed.zip"
      sha256 "35fff423e255c79289279f0916919c327e575eed47bd73df8c80d0f4ba7c85eb"
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