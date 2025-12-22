


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.60.9"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.60.9/netbird-ui_0.60.9_darwin_amd64_signed.zip"
      sha256 "6666bfc20a82261652ec938db1fd0d65d41f9895669e726605e5a7f091219101"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.60.9/netbird-ui_0.60.9_darwin_arm64_signed.zip"
      sha256 "6691bd0554750fcfb2cd2e70342d7dc92492d8ddb337758ea09825d877e5a0b1"
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
