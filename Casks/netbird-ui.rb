


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.18.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.18.0/netbird-ui_0.18.0_darwin_amd64_signed.zip"
      sha256 "b489d95fc5891694e0150d3b22a304f3c88a3259f109a0bebd6547e4d73b5a97"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.18.0/netbird-ui_0.18.0_darwin_arm64_signed.zip"
      sha256 "1bc0267cf4cd84018e978f445c479d907402cf06c731dea553bcdda064c76694"
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