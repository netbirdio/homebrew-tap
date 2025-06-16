


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.47.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.47.0/netbird-ui_0.47.0_darwin_amd64_signed.zip"
      sha256 "d7776a39b79ae14ac151ed7614cba5cc960816c490bbf3dfcee482428408796d"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.47.0/netbird-ui_0.47.0_darwin_arm64_signed.zip"
      sha256 "c4027fc45bf1708611140aba8bbebab364ebc421ed46e6a9ff2046e594d8c894"
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
