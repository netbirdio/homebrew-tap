


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.54.2"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.54.2/netbird-ui_0.54.2_darwin_amd64_signed.zip"
      sha256 "7be7e24dba2ce4f8b0fb1b8ec6103912f5c5470cb5a982b555e1165b18bcd736"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.54.2/netbird-ui_0.54.2_darwin_arm64_signed.zip"
      sha256 "848b5daa1b18b98b7ffc11d03492e61398735b31ec3067a17c4bd90d49cb71ce"
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
