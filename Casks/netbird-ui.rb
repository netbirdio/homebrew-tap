


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.27.4"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.27.4/netbird-ui_0.27.4_darwin_amd64_signed.zip"
      sha256 "c4d94ec4827b0d2b154ff651222d1daf9133571d6a29338be8276eab9be35efe"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.27.4/netbird-ui_0.27.4_darwin_arm64_signed.zip"
      sha256 "4ba3ca255d609d090285a1c07e7a2fe4f950a91c8bf54f71b8e84170fe97665e"
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