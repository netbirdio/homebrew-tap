


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.26.6"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.26.6/netbird-ui_0.26.6_darwin_amd64_signed.zip"
      sha256 "942c6cce68eb42e65c71b156ec39c32cfc98443e7ce561b8708a014911ec476a"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.26.6/netbird-ui_0.26.6_darwin_arm64_signed.zip"
      sha256 "07c44a7169fd676a0d360b028d6bc4c473314ddb191a771f91c19560446aeebf"
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