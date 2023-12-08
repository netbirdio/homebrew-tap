


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.24.4"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.24.4/netbird-ui_0.24.4_darwin_amd64_signed.zip"
      sha256 "ead889339c9ed66ce26e469c9a689e1cbbc985d501e9c4ef74738453b8e73147"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.24.4/netbird-ui_0.24.4_darwin_arm64_signed.zip"
      sha256 "ecdfb03f81eaa5c4ab633b0e144661f1afae7a1f7edb6b8285be9d7d6dddf329"
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