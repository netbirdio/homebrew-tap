


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.43.3"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.43.3/netbird-ui_0.43.3_darwin_amd64_signed.zip"
      sha256 "64039e7c6006f4d5873bf91f26f0f9d582df0d044be85103f7345ff750e3679b"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.43.3/netbird-ui_0.43.3_darwin_arm64_signed.zip"
      sha256 "0010371ab9c48e3b4ac2232513432029d58ec3a90db890b532d8fe7587f3be3b"
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
