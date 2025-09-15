


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.57.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.57.1/netbird-ui_0.57.1_darwin_amd64_signed.zip"
      sha256 "a2fd30729a7d664d31f1ea16245b9c165f9f749f550ff10fc371574bb4fa9137"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.57.1/netbird-ui_0.57.1_darwin_arm64_signed.zip"
      sha256 "e0129f75fbfb4ecc921e9246f1aac88a0e79716b70d1c6c64a24bc091f791f36"
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
