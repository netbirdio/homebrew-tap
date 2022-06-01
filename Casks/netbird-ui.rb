


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.6.2"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.6.2/netbird-ui_0.6.2_darwin_amd64_signed.zip"
      sha256 "69a6089bcfaf0a889a2da232b8a362d1de83b6ebb211d51cfb8b09eadb3cfcdd"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.6.2/netbird-ui_0.6.2_darwin_arm64_signed.zip"
      sha256 "94c6140cdcd87df2adef2de125631e412b984e0657866c2f3cd557b5808c7c16"
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