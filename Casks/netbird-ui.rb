


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.53.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.53.0/netbird-ui_0.53.0_darwin_amd64_signed.zip"
      sha256 "6bd347956765c0104cd6500bba3592471b94c030b7d569a0d6470f66b169e80d"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.53.0/netbird-ui_0.53.0_darwin_arm64_signed.zip"
      sha256 "70f80c3a1bf19116653fd0ecac71fda1001c8f946fc09d3e6c394b4e6a5001fe"
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
