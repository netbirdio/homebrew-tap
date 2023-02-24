


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.14.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.14.1/netbird-ui_0.14.1_darwin_amd64_signed.zip"
      sha256 "d424e149c02682eb9abe8b799914815428e13ed490dd24e6088d853e7e3f5380"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.14.1/netbird-ui_0.14.1_darwin_arm64_signed.zip"
      sha256 "160e18237fd3327303e0c1c1c1c41696161a3071274de108c7ad51c50c42a5bd"
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