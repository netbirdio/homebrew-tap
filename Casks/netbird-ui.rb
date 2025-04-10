


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.40.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.40.1/netbird-ui_0.40.1_darwin_amd64_signed.zip"
      sha256 "ebc4a1b4db7d670ec6f4f750121cc8beaef7ce70a13ad2b1af433bb3f8bea01b"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.40.1/netbird-ui_0.40.1_darwin_arm64_signed.zip"
      sha256 "84c58605437cdc7607b1a4eb409e054f70b18d9e8f51f8a8c48bf6cc1909c333"
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
