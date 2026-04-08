


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.68.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.68.0/netbird-ui_0.68.0_darwin_amd64_signed.zip"
      sha256 "3e67f87296c14ac2710c7798c02a344f6a6d0b4ed507574f6f9b650cba1816b0"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.68.0/netbird-ui_0.68.0_darwin_arm64_signed.zip"
      sha256 "9ec8a2bc985efbc8b24c3d70ffe27566b5f39f256eac5e4329e76fd212671ed8"
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
