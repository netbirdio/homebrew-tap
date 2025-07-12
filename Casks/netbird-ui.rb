


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.50.3"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.50.3/netbird-ui_0.50.3_darwin_amd64_signed.zip"
      sha256 "c0b8a7e30d6795e5efa5b9e27c14aae4a4ca55e2264f8a886fb00c9613389b7e"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.50.3/netbird-ui_0.50.3_darwin_arm64_signed.zip"
      sha256 "01926e3f29363f5ea0a7aef3cd0eceaae12861ecaa6ba8692496e39d34301f45"
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
