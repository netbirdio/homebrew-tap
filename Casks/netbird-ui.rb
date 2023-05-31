


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.20.5"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.20.5/netbird-ui_0.20.5_darwin_amd64_signed.zip"
      sha256 "eb332c27130265267c614c27340a3647a03570d4ad087809d2855b7103338c1e"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.20.5/netbird-ui_0.20.5_darwin_arm64_signed.zip"
      sha256 "1f960e34bb7b3b420d7ee2d2f5edfeef07f2e52f0bb48f523759159ea62d632d"
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