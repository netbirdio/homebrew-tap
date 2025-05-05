


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.43.2"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.43.2/netbird-ui_0.43.2_darwin_amd64_signed.zip"
      sha256 "64abed653ed59f32be4b0413b8f78480d2535879e65fd1fce8b8611a3083b176"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.43.2/netbird-ui_0.43.2_darwin_arm64_signed.zip"
      sha256 "41be8b1ba8aee3305847e3e3a03177c1af8d87902c58bba323695878057c7a97"
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
