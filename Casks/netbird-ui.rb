


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.22.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.22.1/netbird-ui_0.22.1_darwin_amd64_signed.zip"
      sha256 "bc5888161a8ee0954e3691c2431f368e4b5a28679ce229760db856e3585dad02"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.22.1/netbird-ui_0.22.1_darwin_arm64_signed.zip"
      sha256 "af101244059aeac8c1041761e4f081f9705cf74519d5d6366fc063b2f5ffdf88"
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