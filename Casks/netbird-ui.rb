


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.39.2"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.39.2/netbird-ui_0.39.2_darwin_amd64_signed.zip"
      sha256 "01f7a7d269e3aee306fb7bc63df160a8cdc55274dc1388fb5eae206d467516a3"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.39.2/netbird-ui_0.39.2_darwin_arm64_signed.zip"
      sha256 "181363beb9e3f652a91bc443f885d7704541d97197ec6d04e1cbdf1f9ab90c5e"
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
