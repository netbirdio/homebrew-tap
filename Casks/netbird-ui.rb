


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.48.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.48.0/netbird-ui_0.48.0_darwin_amd64_signed.zip"
      sha256 "6869b482565697b5bc4b83d5c661f8c5d36bcc395e3021e904a476cb35e96607"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.48.0/netbird-ui_0.48.0_darwin_arm64_signed.zip"
      sha256 "d674f414e84eb2dee4b2347d457d5c9f89aea4059d01a71bb80bd8a63b4ec65e"
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
