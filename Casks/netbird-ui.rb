


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.25.8"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.25.8/netbird-ui_0.25.8_darwin_amd64_signed.zip"
      sha256 "74b4e66ba5cd309930c93404b06836b4ad7e011f05305dfffb2532779daad56d"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.25.8/netbird-ui_0.25.8_darwin_arm64_signed.zip"
      sha256 "87fc377786db2704c9f6c25ac0318eaa239eb4fa8e4487bd5141122df1ea5147"
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