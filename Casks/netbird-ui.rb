


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.47.2"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.47.2/netbird-ui_0.47.2_darwin_amd64_signed.zip"
      sha256 "7266b048b93b245921a8e2a0b4406d3fba96fe082360a0f076e67155a03b80b2"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.47.2/netbird-ui_0.47.2_darwin_arm64_signed.zip"
      sha256 "258b0f957454acd71bbe1c5eabe7071fc0f433e5142266f3e10ec695c3cd3f7e"
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
