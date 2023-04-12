


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.15.3"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.15.3/netbird-ui_0.15.3_darwin_amd64_signed.zip"
      sha256 "2e3f84dc40e2c6360ed34d95b88908e1427501f97adcf19e05714403f18c2848"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.15.3/netbird-ui_0.15.3_darwin_arm64_signed.zip"
      sha256 "b801d69e69f5258957fe0cd235225cd80c3acf856670c4ec3a8548d69e7e5f78"
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