


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.26.4"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.26.4/netbird-ui_0.26.4_darwin_amd64_signed.zip"
      sha256 "7c13f123ca7807e801676eb69fd44f575e0e958ee8316758ab14b776a94dc5a3"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.26.4/netbird-ui_0.26.4_darwin_arm64_signed.zip"
      sha256 "c4a88c705883a303afecda8870c6372e413adb0e11851a2bae77904896180736"
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