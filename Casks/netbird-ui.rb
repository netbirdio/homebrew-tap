


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.26.2"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.26.2/netbird-ui_0.26.2_darwin_amd64_signed.zip"
      sha256 "7372743900fd22e7e37c8d593ee163c56c813f7ef2a7a5787cc456abe5dfa742"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.26.2/netbird-ui_0.26.2_darwin_arm64_signed.zip"
      sha256 "1571629de1192cbd525c1ff314878c0d993cf8bccb7c184e943461e88d86dd7c"
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