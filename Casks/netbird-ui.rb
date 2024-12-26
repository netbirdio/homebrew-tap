


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.35.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.35.1/netbird-ui_0.35.1_darwin_amd64_signed.zip"
      sha256 "47fb4dd17460758ad944d7b090dcdc04a739d5e1831f4a1e168216d4764fd226"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.35.1/netbird-ui_0.35.1_darwin_arm64_signed.zip"
      sha256 "7be5aa251eac22d1f74106723f64a5fcbf9c2e78a88d9dc4e4f6d20b7debd492"
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
