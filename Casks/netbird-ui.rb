


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.28.3"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.28.3/netbird-ui_0.28.3_darwin_amd64_signed.zip"
      sha256 "7e73cfadb83eace62f0d990fbd3809110c52835545d8ddd2e3838b14b152a477"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.28.3/netbird-ui_0.28.3_darwin_arm64_signed.zip"
      sha256 "50be4163d54dbefd65b48cbed67ee0a55b993f721664b9be34cb2ff9c1d3f2de"
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