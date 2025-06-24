


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.49.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.49.0/netbird-ui_0.49.0_darwin_amd64_signed.zip"
      sha256 "50e3c278e2eda744dbfac9ec7d1141ca57d13389625f2ba2a9a7c61a03db64ed"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.49.0/netbird-ui_0.49.0_darwin_arm64_signed.zip"
      sha256 "306b4391e60d4c5882098d170fcae0e1d13ad8a9ca8a9043e806da959d613524"
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
