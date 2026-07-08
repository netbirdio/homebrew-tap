


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.74.3"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.74.3/netbird-ui_0.74.3_darwin_amd64_signed.zip"
      sha256 "2a98d7a2068c907f4a309e51e76a47d9cfae61d44516de695ce58619b985fc7c"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.74.3/netbird-ui_0.74.3_darwin_arm64_signed.zip"
      sha256 "d5c0fcca5510462dc6514afbc39946c5ece753387a3a12d33a32d02f75b97c48"
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
