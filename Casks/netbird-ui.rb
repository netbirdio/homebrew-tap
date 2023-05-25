


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.20.4"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.20.4/netbird-ui_0.20.4_darwin_amd64_signed.zip"
      sha256 "c2d8bbe4816fea1233ef766b546ccad5c2c72aaee440ea5f39c9d5f06148603c"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.20.4/netbird-ui_0.20.4_darwin_arm64_signed.zip"
      sha256 "c8794e19dd78f9a88ae5e550376fd8f196192d58a13f0c2952ca5157fb04c0fc"
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