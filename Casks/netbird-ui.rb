


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.9.4"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.9.4/netbird-ui_0.9.4_darwin_amd64_signed.zip"
      sha256 "f3f652a1313399dd2e29a6692e7af6f0f6e82f40ff0b0b475a23cd5518a9d5d0"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.9.4/netbird-ui_0.9.4_darwin_arm64_signed.zip"
      sha256 "214040abff27b95e9ca1893454e62cead4e8cc05015f3e8210a583b27b7ac49e"
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