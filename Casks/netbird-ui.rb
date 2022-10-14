


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.9.8"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.9.8/netbird-ui_0.9.8_darwin_amd64_signed.zip"
      sha256 "b5b0b85f4ae1a56e8a5221f15b94bf18a84044bdf8c64a708045b8824b219465"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.9.8/netbird-ui_0.9.8_darwin_arm64_signed.zip"
      sha256 "a72e541579fda64f6060c7e861d2c4f21bcca6e90d076a66e724adba621c9004"
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