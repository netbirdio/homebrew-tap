


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.10.9"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.10.9/netbird-ui_0.10.9_darwin_amd64_signed.zip"
      sha256 "34796d19c9e787e6ba58d10e2cfaf7511934ba392906311e0355ed74cafe12a6"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.10.9/netbird-ui_0.10.9_darwin_arm64_signed.zip"
      sha256 "76c8515eb5d3c9f375681a00ae5f75f0290045094f8e8ec9499d2f9aafe32947"
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