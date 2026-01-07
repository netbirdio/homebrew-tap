


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.62.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.62.0/netbird-ui_0.62.0_darwin_amd64_signed.zip"
      sha256 "94244ff4efbfe39a1e9a85d6759f4322de6aff2ca1232e0cd79b3b51ac8d972f"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.62.0/netbird-ui_0.62.0_darwin_arm64_signed.zip"
      sha256 "bf662f43310019aae3cc2bad5191389e6fcd67c4995fd8fb2faba736aa49e44b"
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
