


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.31.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.31.1/netbird-ui_0.31.1_darwin_amd64_signed.zip"
      sha256 "01dcf8b2a603f1c0a39f17d68781bc99b43a01fce5302835d3a4b09b4779a818"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.31.1/netbird-ui_0.31.1_darwin_arm64_signed.zip"
      sha256 "e3c5b2c38539d2da1e59e3802f587736d1ec5138649e1cfa704712be954e32c7"
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
