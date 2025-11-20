


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.60.2"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.60.2/netbird-ui_0.60.2_darwin_amd64_signed.zip"
      sha256 "5d0c7a99196aea8006930df7bc8eba70a5f53e48204eda205eabbb6938b63768"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.60.2/netbird-ui_0.60.2_darwin_arm64_signed.zip"
      sha256 "2f23e92b9ebd5601ef96ac74e42a05602d4c2e1f85c21b1897fed4de3094c4ab"
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
