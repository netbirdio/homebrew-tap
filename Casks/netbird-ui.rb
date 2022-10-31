


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.10.3"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.10.3/netbird-ui_0.10.3_darwin_amd64_signed.zip"
      sha256 "a23a59f012eb346d62d106bd83cfc2046cb0da92327dc4c8899f1a6a0c6a19d3"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.10.3/netbird-ui_0.10.3_darwin_arm64_signed.zip"
      sha256 "3ff3e998a90347866192f00c8db8014a4aa6631d9fbe083a42df866da1aee814"
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