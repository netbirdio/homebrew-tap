


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.10.4"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.10.4/netbird-ui_0.10.4_darwin_amd64_signed.zip"
      sha256 "be74eb84f0cc0d894d7de7c652d443fe8b21b1ddf345e31b5ea9244af667c5e1"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.10.4/netbird-ui_0.10.4_darwin_arm64_signed.zip"
      sha256 "1ea69cb1ec8b4f1fcc6f7546a7e9cfee20fa964aa94ee0f8ce61091dd1f0050d"
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