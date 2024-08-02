


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.28.7"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.28.7/netbird-ui_0.28.7_darwin_amd64_signed.zip"
      sha256 "42965162bc31d0d546fd8b9ebf0249abda4cece555d11920d29cf44adc8fb2af"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.28.7/netbird-ui_0.28.7_darwin_arm64_signed.zip"
      sha256 "d6a5f81742ffdd015ef8a93815e13213b7451a8f8e448addcb5a53f5df1257c1"
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