


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.27.9"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.27.9/netbird-ui_0.27.9_darwin_amd64_signed.zip"
      sha256 "549049cb38b5b88d8c59b6413b05078aefcd60392c34ae6fb510e04b815cf4b3"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.27.9/netbird-ui_0.27.9_darwin_arm64_signed.zip"
      sha256 "a71dc07ca7e394dfadcd0704ca2f3c160a52ba4493f6e260874168637f39d1ad"
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