


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.66.3"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.66.3/netbird-ui_0.66.3_darwin_amd64_signed.zip"
      sha256 "afdb3a00a9e9158ee10d936f91b5b5022318326fac6088493bd01c21db252c3e"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.66.3/netbird-ui_0.66.3_darwin_arm64_signed.zip"
      sha256 "98853bdac5a03c5f074775f1849f9be05288034cee97fbdc0c13aa2e880c12dd"
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
