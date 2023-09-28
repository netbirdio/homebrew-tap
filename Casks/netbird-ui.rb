


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.23.5"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.23.5/netbird-ui_0.23.5_darwin_amd64_signed.zip"
      sha256 "f98a15b7bd79b369fc56d5a41204aac0d5584ec81223f9f062f52ad281373f98"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.23.5/netbird-ui_0.23.5_darwin_arm64_signed.zip"
      sha256 "1c298d1c71b8c822a2851f5790594fe4bea0fe03759ad0db03677c9427efaee1"
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