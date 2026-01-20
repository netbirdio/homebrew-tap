


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.64.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.64.0/netbird-ui_0.64.0_darwin_amd64_signed.zip"
      sha256 "e18644c4ee94154f00a579be1181d7136d7168b23db93a0ebef3504fa306f684"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.64.0/netbird-ui_0.64.0_darwin_arm64_signed.zip"
      sha256 "659a8df3ae692dcda875cadc5da51aac2334581bb974a888fb299cd81f5a0896"
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
