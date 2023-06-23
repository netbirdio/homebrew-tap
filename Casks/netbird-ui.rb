


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.21.7"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.21.7/netbird-ui_0.21.7_darwin_amd64_signed.zip"
      sha256 "c4791fee88b0fb1a9a94a840481924b7004887cc82943ed883080cfc7cdd3b22"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.21.7/netbird-ui_0.21.7_darwin_arm64_signed.zip"
      sha256 "e5827f34227c550a77e781d101262cfec88575171a8fec6f571e596a89650b69"
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