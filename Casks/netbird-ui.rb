


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.71.4"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.71.4/netbird-ui_0.71.4_darwin_amd64_signed.zip"
      sha256 "806a5bf83ab1573fcccc78d0fb4145a68785ff0817c5e54f1be05f0d6da5be6c"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.71.4/netbird-ui_0.71.4_darwin_arm64_signed.zip"
      sha256 "c8e775c16e54b0f5ad1f65a3d1cef3b28693df59b008193fe86ca09f88a63a24"
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
