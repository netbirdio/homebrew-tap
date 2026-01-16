


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.63.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.63.0/netbird-ui_0.63.0_darwin_amd64_signed.zip"
      sha256 "bee6aaf442ba52f9f1037ef66ade40431cf0775286dc0107ec0187e5ba3dc694"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.63.0/netbird-ui_0.63.0_darwin_arm64_signed.zip"
      sha256 "1cc14c7ec91498076412b55501709bfe97554a8729d7773a9bb6c4236a041040"
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
