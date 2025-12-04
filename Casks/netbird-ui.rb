


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.60.7"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.60.7/netbird-ui_0.60.7_darwin_amd64_signed.zip"
      sha256 "3f9d67da76d89c11e94c6e9756449ccd9b206eb6b7cfa00554eacb80038d6e51"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.60.7/netbird-ui_0.60.7_darwin_arm64_signed.zip"
      sha256 "c190eec95bb0cdbe55f16cae26573d2798b1de93ea878f920718b73861cf65d7"
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
