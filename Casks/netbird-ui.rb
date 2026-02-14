


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.65.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.65.1/netbird-ui_0.65.1_darwin_amd64_signed.zip"
      sha256 "7e375bb47001d0f80044ecbcdcf78e7b7dc3a97a61299323c8756139c31da25c"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.65.1/netbird-ui_0.65.1_darwin_arm64_signed.zip"
      sha256 "f1867dc44579b9c163baa50d409afccf020d844e0f2de9d8ff31e4571af673da"
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
