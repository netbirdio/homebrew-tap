


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.8.5"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.8.5/netbird-ui_0.8.5_darwin_amd64_signed.zip"
      sha256 "83c5f5bcd6995a956dba59e998b54ed3b40ee4860e29ae01c22419238710ed09"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.8.5/netbird-ui_0.8.5_darwin_arm64_signed.zip"
      sha256 "e5abeaeaf02f1fe13e1080ad669dc5bed01c07dbddc538e6fb1ec249ca365c02"
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