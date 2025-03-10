


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.38.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.38.0/netbird-ui_0.38.0_darwin_amd64_signed.zip"
      sha256 "7781ca4697d1739e190d6e1d8445b7d9a50c9ebad520c398e5fde5cb416fac74"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.38.0/netbird-ui_0.38.0_darwin_arm64_signed.zip"
      sha256 "9d1bc2d6096e5fca14cbd899ba2f87cc8672b4af0291de983996d474ddc5d58b"
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
