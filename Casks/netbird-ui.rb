


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.26.7"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.26.7/netbird-ui_0.26.7_darwin_amd64_signed.zip"
      sha256 "9832b6105e0a27de0c772a2e6529aab34c9dea290ef19aa61cd1278009170235"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.26.7/netbird-ui_0.26.7_darwin_arm64_signed.zip"
      sha256 "5954b75595ca4b83a73b0050e9c23663272f46e7d711bc44358b132482cafbce"
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