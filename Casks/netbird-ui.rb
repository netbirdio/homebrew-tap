


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.74.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.74.1/netbird-ui_0.74.1_darwin_amd64_signed.zip"
      sha256 "3def2b625e152f032a3bbf0cf78592c2a34f648829e587074710e70d9b8e5d23"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.74.1/netbird-ui_0.74.1_darwin_arm64_signed.zip"
      sha256 "4552e4c860e9d3292f483e79f396614900660431d4056b290c3579a2daa432b0"
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
