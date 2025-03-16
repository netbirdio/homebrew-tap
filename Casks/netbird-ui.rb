


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.38.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.38.1/netbird-ui_0.38.1_darwin_amd64_signed.zip"
      sha256 "9d9726b1360fcf79f06c23e39aa6ebb64826d910961511e6fbdaed3e3ca2ea49"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.38.1/netbird-ui_0.38.1_darwin_arm64_signed.zip"
      sha256 "584fbba98250816b56b6b810134d49b013d1999ef3847e7589a0a4463fe66fec"
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
