


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.13.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.13.0/netbird-ui_0.13.0_darwin_amd64_signed.zip"
      sha256 "1d6ddd79a07c845fe4f213cb2f2f3ea8c16194d99c2cfee83769d631d806a9c3"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.13.0/netbird-ui_0.13.0_darwin_arm64_signed.zip"
      sha256 "f70c304e61016bf508670d8bd1134140fa86ecea1d0a54317e458634e0895919"
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