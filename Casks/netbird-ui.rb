


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.11.6"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.11.6/netbird-ui_0.11.6_darwin_amd64_signed.zip"
      sha256 "b91b73435c848e490e48873e50fd974ad67c1530d8b77642122b826f9ef6fcbb"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.11.6/netbird-ui_0.11.6_darwin_arm64_signed.zip"
      sha256 "98e2e662db7088dfb7f59ad93f3c3b673ee335e6d9edcd688191debf96c41b05"
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