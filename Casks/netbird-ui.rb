


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.72.4"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.72.4/netbird-ui_0.72.4_darwin_amd64_signed.zip"
      sha256 "44b39b15bbf5e446f7a0c3c7532cccf6f7fa1f83235382b2c0e775b72a70fb01"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.72.4/netbird-ui_0.72.4_darwin_arm64_signed.zip"
      sha256 "0c370c63c8b8c8dd67b9c488b51c0356483594f454697b21cf1c860caa16c796"
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
