


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.41.3"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.41.3/netbird-ui_0.41.3_darwin_amd64_signed.zip"
      sha256 "edd05bd3377e1219637f2a2a30c595d94e5743b5a6d710679773e19c1dda46f3"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.41.3/netbird-ui_0.41.3_darwin_arm64_signed.zip"
      sha256 "a5cb5e1348daa01a22278df30c7d91fa8d72a24e8ae904bf8f3b0daddd30b49d"
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
