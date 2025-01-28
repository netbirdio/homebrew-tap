


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.36.4"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.36.4/netbird-ui_0.36.4_darwin_amd64_signed.zip"
      sha256 "314a3bd2ab3031584122fe3e3f3ed13d5b61efe998d1bf32b04fd6d22d6f66f1"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.36.4/netbird-ui_0.36.4_darwin_arm64_signed.zip"
      sha256 "4073c4a60f9e0ba1189f03e9e6b41ed8d5fe8dfdad880451c4987fd5f497b565"
      app "netbird_ui_darwin", target: "Netbird UI.app"
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
