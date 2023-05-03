


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.19.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.19.0/netbird-ui_0.19.0_darwin_amd64_signed.zip"
      sha256 "8108d5a3bff996a91a01e71becbfc2366c497702fcefe59f6371130f3dd9cbe4"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.19.0/netbird-ui_0.19.0_darwin_arm64_signed.zip"
      sha256 "0c14c43006b27482bf20a4c5c07f249ba176775cc4836d54b6b6875e2ba2d5f1"
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