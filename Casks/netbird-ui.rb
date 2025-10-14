


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.59.6"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.59.6/netbird-ui_0.59.6_darwin_amd64_signed.zip"
      sha256 "29b6a2d45df1c2b8107073505e057f029ff9a8e6c3bf52ca54191b753f3c8650"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.59.6/netbird-ui_0.59.6_darwin_arm64_signed.zip"
      sha256 "8a88000b1bf9e49dd4a88ad82bd4017c04b8afcc3fd1977fea6c3066371f302a"
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
