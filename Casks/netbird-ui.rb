


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.35.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.35.0/netbird-ui_0.35.0_darwin_amd64_signed.zip"
      sha256 "0a65137a3914ef86ca4e6a6d192734e6b684bd88bddedba86b4f69bc2930814e"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.35.0/netbird-ui_0.35.0_darwin_arm64_signed.zip"
      sha256 "b79f408446dc8940f3b54fc293a12e17f2495a089857c0233ca1cfc53b63be53"
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
