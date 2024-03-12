


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.26.3"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.26.3/netbird-ui_0.26.3_darwin_amd64_signed.zip"
      sha256 "675c4df4e6452b3e5ea5580633fd5e99fb4afd02dbae69002e57f70cf4a968fe"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.26.3/netbird-ui_0.26.3_darwin_arm64_signed.zip"
      sha256 "99d5e5f92928941a8adb555cff7430e2c1a46448eda14bb2ed373488df5c30c9"
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