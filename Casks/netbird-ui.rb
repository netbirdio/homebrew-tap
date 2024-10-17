


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.30.2"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.30.2/netbird-ui_0.30.2_darwin_amd64_signed.zip"
      sha256 "a644c7da71595872b154ce56a9ecc5aad68fb8f3295d966899b5b5f0aeb607d9"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.30.2/netbird-ui_0.30.2_darwin_arm64_signed.zip"
      sha256 "66954d82867c23f207dff58cecb07b0174f76c953bc29d031fccf07f7f439e57"
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
