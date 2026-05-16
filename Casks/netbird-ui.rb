


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.71.2"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.71.2/netbird-ui_0.71.2_darwin_amd64_signed.zip"
      sha256 "d6555402b42c7944bc026ee06644889ddad3653a0a947369c1c25c07afe2ac02"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.71.2/netbird-ui_0.71.2_darwin_arm64_signed.zip"
      sha256 "197c6a5c7eb8f46dd3d6217def3a098451f929606f68293284f6af16950aed6c"
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
