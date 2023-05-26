


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.20.5"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.20.5/netbird-ui_0.20.5_darwin_amd64_signed.zip"
      sha256 "8f6261f8a78aa559df7ae524525998f6a5fba3eaee2a71267912e5fbd7c73ec8"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.20.5/netbird-ui_0.20.5_darwin_arm64_signed.zip"
      sha256 "77cc8117701ddb7f39e1d8bddfc9bd59eab6850aa22524dc7c91f7c241a60ff9"
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