


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.20.6"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.20.6/netbird-ui_0.20.6_darwin_amd64_signed.zip"
      sha256 "f0ea922570588b3a2b56abb744e07d3453d12b51e7b6ef744e501a1feb915341"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.20.6/netbird-ui_0.20.6_darwin_arm64_signed.zip"
      sha256 "6cc0877a342614ad0e42eb346cee473323ba6b99fcb108ef07b2048861c29fc8"
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