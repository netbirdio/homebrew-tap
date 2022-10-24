


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.10.2"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.10.2/netbird-ui_0.10.2_darwin_amd64_signed.zip"
      sha256 "63d6dcd2d940547f1d83e49c5adf1c71f7b97c910b1ac7736ea64d632bc49615"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.10.2/netbird-ui_0.10.2_darwin_arm64_signed.zip"
      sha256 "12bb6ad1fd7a0faf8cef5291b55047451dfceb5e076888d0293e1edd8268bfd7"
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