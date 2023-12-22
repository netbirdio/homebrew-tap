


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.25.2"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.25.2/netbird-ui_0.25.2_darwin_amd64_signed.zip"
      sha256 "0cad36d029f25db8125a20efe6dac93fb60ee40efe9e529407bb1086c913560a"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.25.2/netbird-ui_0.25.2_darwin_arm64_signed.zip"
      sha256 "884584b83f8cd1554cde63199e3a814263dd02da20b01544e6620281bdc01fb6"
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