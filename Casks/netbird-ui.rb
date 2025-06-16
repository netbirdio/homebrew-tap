


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.47.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.47.1/netbird-ui_0.47.1_darwin_amd64_signed.zip"
      sha256 "bb3d509a64e7777771cbdde5f78a009fe2d0411defd75eac7f99cb9dcd62f72c"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.47.1/netbird-ui_0.47.1_darwin_arm64_signed.zip"
      sha256 "cbdc31418152948746f9664c0beabfbca36ca74425dd71a3be83c83a777c3cb0"
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
