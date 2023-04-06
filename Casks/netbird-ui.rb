


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.15.2"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.15.2/netbird-ui_0.15.2_darwin_amd64_signed.zip"
      sha256 "4c397647e6720fc31dfde6a588cdaf99233fa1486163951058bced2bb650fe7d"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.15.2/netbird-ui_0.15.2_darwin_arm64_signed.zip"
      sha256 "37c515688d5b126300e799773062ebcff0fe64a2121b9ec97160eba05ca5d374"
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