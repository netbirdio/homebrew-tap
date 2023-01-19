


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.12.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.12.0/netbird-ui_0.12.0_darwin_amd64_signed.zip"
      sha256 "7a30ab852f8c8d582cbff7b9f0c1023f486c56ccd7c6d1083837db5951701e19"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.12.0/netbird-ui_0.12.0_darwin_arm64_signed.zip"
      sha256 "817ee39caf81d278f771cf6db9e2579178616ed20ad734e1e03c9ae763b68607"
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