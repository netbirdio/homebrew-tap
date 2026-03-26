


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.67.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.67.1/netbird-ui_0.67.1_darwin_amd64_signed.zip"
      sha256 "e8ed605195c1f207fadc77732e94ce332367da12f0edc168bfef77c459d8e22e"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.67.1/netbird-ui_0.67.1_darwin_arm64_signed.zip"
      sha256 "57aee5044ac292a6268944a4b28da2018e9e7db09a41f501867c9c8dc86551cb"
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
