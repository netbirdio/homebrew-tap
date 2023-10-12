


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.23.9"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.23.9/netbird-ui_0.23.9_darwin_amd64_signed.zip"
      sha256 "7494a5a8c1a1d7a3a151de7b3ece29f83cafd92594f3cbe33edb5d5e39a70d15"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.23.9/netbird-ui_0.23.9_darwin_arm64_signed.zip"
      sha256 "de5deeb28bb5bf2f13cad9afdc6164db22f3324eb44146d135f19d051cae34d1"
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