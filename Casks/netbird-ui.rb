


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.29.2"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.29.2/netbird-ui_0.29.2_darwin_amd64_signed.zip"
      sha256 "f2f9004d7b577c81ac0ef083321122fc7b1c5467e643d35474536adf529d64d8"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.29.2/netbird-ui_0.29.2_darwin_arm64_signed.zip"
      sha256 "9bc5252ced6242da4826a3b628a31e132bf36884673589b26b273930358c8005"
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