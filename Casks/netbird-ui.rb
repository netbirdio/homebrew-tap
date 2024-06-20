


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.28.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.28.1/netbird-ui_0.28.1_darwin_amd64_signed.zip"
      sha256 "366901981bdecbf4c07afed90b273c63a187749670f3340d0c4c5f9abfb35004"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.28.1/netbird-ui_0.28.1_darwin_arm64_signed.zip"
      sha256 "0326bcefbbeac907b12234771bb59f9b3eeea860f449d2905c99ddf07c97c203"
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