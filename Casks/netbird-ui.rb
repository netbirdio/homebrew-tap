


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.29.3"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.29.3/netbird-ui_0.29.3_darwin_amd64_signed.zip"
      sha256 "f01539c954c8271584fba450f96205afdbb7dc9ab0b603d669b61ec902c77e83"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.29.3/netbird-ui_0.29.3_darwin_arm64_signed.zip"
      sha256 "48fe8ef6aac0642a266d14980b6b5aaf37a17d04a112faa5aaeca84c439dd681"
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