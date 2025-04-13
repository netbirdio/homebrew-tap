


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.41.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.41.0/netbird-ui_0.41.0_darwin_amd64_signed.zip"
      sha256 "143ad7d2880d7d23e7221eee6304a8ef401829204bf65a790fd2addeb04c7468"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.41.0/netbird-ui_0.41.0_darwin_arm64_signed.zip"
      sha256 "6f2132012c4fdb0cb6299a31db9ff8d723b6e49235e02619988838aa10f49f96"
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
