


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.56.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.56.1/netbird-ui_0.56.1_darwin_amd64_signed.zip"
      sha256 "5ef0d18277ffe43199a3cb7111ba7b4acca9c2bec57fb520a74178447ffba64d"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.56.1/netbird-ui_0.56.1_darwin_arm64_signed.zip"
      sha256 "d9183f33b2d4136ea12c480fd1edfb97e60f84f14db55a1d12696d9148e1a0a2"
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
