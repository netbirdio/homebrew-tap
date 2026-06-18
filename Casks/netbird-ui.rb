


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.73.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.73.0/netbird-ui_0.73.0_darwin_amd64_signed.zip"
      sha256 "2216037145e93543766190d00efac855d12d8778c5bbe5a871fa2f7ef71f7abc"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.73.0/netbird-ui_0.73.0_darwin_arm64_signed.zip"
      sha256 "8a98998f23b860f38375f29de2b8cadf92f89186dbe63ae833fec6d5c8af4a28"
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
