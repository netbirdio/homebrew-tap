


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.23.2"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.23.2/netbird-ui_0.23.2_darwin_amd64_signed.zip"
      sha256 "23cfe5126396ed73f7b3e1d13345f0ac950e493a824918aa2b84bc1ff7a0d642"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.23.2/netbird-ui_0.23.2_darwin_arm64_signed.zip"
      sha256 "4e200ad93b41a3ebcbc9650bf6fba65ac6bbcea44f6b465b11413cfda151ee11"
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