# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.64.5"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.64.5/netbird-ui_0.64.5_darwin_amd64_signed.zip"
      sha256 "9d169380fccb5952703d91e2894d68dbaf3871bdc06145e18285f2b9860a27c6"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.64.5/netbird-ui_0.64.5_darwin_arm64_signed.zip"
      sha256 "bc5f9f7490a8cc51b2d0ecec91394f7c9be88b2ba4ee5c5f94b6f4d315f84b56"
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
    uninstaller = "#{appdir}/Netbird UI.app/uninstaller.sh"

    if File.exist?(uninstaller)
      system_command uninstaller,
                     sudo: false
    end
  end

  name "Netbird UI"
  desc "Netbird UI Client"
  homepage "https://www.netbird.io/"
end
