


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.76.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.76.0/netbird-ui_0.76.0_darwin_amd64_signed.zip"
      sha256 "045348e2dd5bcfec71b58d2930e98586b221aff60a5fbba56edf5dc090e6b083"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.76.0/netbird-ui_0.76.0_darwin_arm64_signed.zip"
      sha256 "103ef8c65eb5ad21ca94e4cb982eb2e1339c4e01a9ee0a25372f4f12027ce932"
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
