


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.21.5"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.21.5/netbird-ui_0.21.5_darwin_amd64_signed.zip"
      sha256 "a83595facc39b061cf65d80b0047d9272359c62b2686f6b0e44084d2f4c2d67b"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.21.5/netbird-ui_0.21.5_darwin_arm64_signed.zip"
      sha256 "365eaac1c0265b023f066aa162be4c90fdbe7c7ee9853dc4ec2cac318b132969"
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