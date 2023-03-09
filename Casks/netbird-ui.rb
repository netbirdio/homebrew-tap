


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.14.3"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.14.3/netbird-ui_0.14.3_darwin_amd64_signed.zip"
      sha256 "b0e575f97a36eb4ecd84eacde64f2a0045b35328c1655afb11b061fab22ea57b"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.14.3/netbird-ui_0.14.3_darwin_arm64_signed.zip"
      sha256 "211786e7b1eae7fda67628fb3b0ac7df9b0e9cbe7dd946a29605e4f66181d88c"
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