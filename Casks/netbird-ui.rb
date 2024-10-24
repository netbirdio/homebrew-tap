


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.30.3"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.30.3/netbird-ui_0.30.3_darwin_amd64_signed.zip"
      sha256 "cd590bc86a1798e3a93df9f56db03e9844afa9dfd331344f9c384a53e77e71c7"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.30.3/netbird-ui_0.30.3_darwin_arm64_signed.zip"
      sha256 "e4ebe457fdc1d9096f58fb27294bcf89794f0e0bd9ca74c00eafdb9ac388cc41"
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
