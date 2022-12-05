


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.11.4"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.11.4/netbird-ui_0.11.4_darwin_amd64_signed.zip"
      sha256 "f4389edffa395886668ba91f6feaf060d60971e8837f7884760165dd6ca92ccf"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.11.4/netbird-ui_0.11.4_darwin_arm64_signed.zip"
      sha256 "df9e91540ba960f5a07f99ca79875aa04e9adb9aaeb70192d89fb5ab54d4f395"
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