


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.20.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.20.1/netbird-ui_0.20.1_darwin_amd64_signed.zip"
      sha256 "4518d3a8d9bc7a2124d2a6a15cc1a61ee3c92c6a51d85c7b570062e607434a7f"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.20.1/netbird-ui_0.20.1_darwin_arm64_signed.zip"
      sha256 "51c5677c6d82ce961c6e71c4b02e31d73e3d1982c0aee862dcc672eb4935b794"
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