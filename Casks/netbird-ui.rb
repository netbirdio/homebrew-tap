# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.68.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.68.1/netbird-ui_0.68.1_darwin_amd64_signed.zip"
      sha256 "64c7276e853be48bc35a059ff6ecf9bceeee02647e5982a47f9cf202c7fad3a8"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.68.1/netbird-ui_0.68.1_darwin_arm64_signed.zip"
      sha256 "0d949743c5828655248e0bd6d5d942e76a93bfe527438c167622129dc23ccfb8"
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
    uninstaller = "#{appdir}/Netbird UI.app/uninstaller.sh"

    if File.exist?(uninstaller)
      system_command uninstaller,
                     sudo: false
    end
  end

  name "Netbird UI"
  desc "Netbird UI Client"
  homepage "https://www.netbird.io/"
end
