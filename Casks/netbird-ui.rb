


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.59.3"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.59.3/netbird-ui_0.59.3_darwin_amd64_signed.zip"
      sha256 "00de4c142b01ba03793dcbe7de3e18bfc2d8a3fe216311d3b1176030a667496b"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.59.3/netbird-ui_0.59.3_darwin_arm64_signed.zip"
      sha256 "9ae40c7d5559c49767446f760dfce8fd9e193a6a44fd6b46ba24ca8b38754f8f"
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
