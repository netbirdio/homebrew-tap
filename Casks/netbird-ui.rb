


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.55.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.55.1/netbird-ui_0.55.1_darwin_amd64_signed.zip"
      sha256 "4f0c4ed8004c52498d6878a60a92a6a5d0d218da2c98d5fba2f52ec1191c3d5e"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.55.1/netbird-ui_0.55.1_darwin_arm64_signed.zip"
      sha256 "325953b659a4a6a31535de4f9e75d7c47b3bd9bcd9cb9c331e957a24b8767936"
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
