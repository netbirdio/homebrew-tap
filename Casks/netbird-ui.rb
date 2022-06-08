


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.6.4"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.6.4/netbird-ui_0.6.4_darwin_amd64_signed.zip"
      sha256 "1830cd075fadd31cc9a24a327478b34f68fed51555ceabf9fdeed2d0eec7e383"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.6.4/netbird-ui_0.6.4_darwin_arm64_signed.zip"
      sha256 "86b88b18065bd2968fb77b31fa79df3ba9b64af5c75ffeb77f906e2aade2a077"
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