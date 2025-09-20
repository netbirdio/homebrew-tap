


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.58.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.58.0/netbird-ui_0.58.0_darwin_amd64_signed.zip"
      sha256 "04b5161736adf942f8a62f019e518dd1ba04b6640c186445f2cdcdc79cd73d19"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.58.0/netbird-ui_0.58.0_darwin_arm64_signed.zip"
      sha256 "f56bd9079dbff391fcaea008259500a530901f10aca27f431e7469b6065bc690"
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
