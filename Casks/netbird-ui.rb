


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.10.8"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.10.8/netbird-ui_0.10.8_darwin_amd64_signed.zip"
      sha256 "5045d63cc50941c0ec06f1f711a39a5066fae4041739b4abcad9293d673cc2a1"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.10.8/netbird-ui_0.10.8_darwin_arm64_signed.zip"
      sha256 "05f6034dfb4d19c1d5a21ea5861a25aacb477b4e7616f692053fabf4b9522a5c"
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