


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.50.2"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.50.2/netbird-ui_0.50.2_darwin_amd64_signed.zip"
      sha256 "a57951e7442efc10c00ddc7500b1fd3087a8b403991b6378bc7ceeba926d4ef2"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.50.2/netbird-ui_0.50.2_darwin_arm64_signed.zip"
      sha256 "75baf18bd516db6bc37d12297fc0a08c36b5ffe863e56a7fd9bea99bc9a90914"
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
