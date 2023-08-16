


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.22.6"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.22.6/netbird-ui_0.22.6_darwin_amd64_signed.zip"
      sha256 "0300f42e013daa6c318c4d98c29960aafdf4583b22504ae7eca608d41c373cbb"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.22.6/netbird-ui_0.22.6_darwin_arm64_signed.zip"
      sha256 "a324edf2a206e42d85746d9526d00d345790f5997defe0b7283d15ed7a2b09a7"
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