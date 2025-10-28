


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.59.9"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.59.9/netbird-ui_0.59.9_darwin_amd64_signed.zip"
      sha256 "90be291d92a76bbaea5e96517b9d38998f57642ea3d04362cf74f87b0743dc17"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.59.9/netbird-ui_0.59.9_darwin_arm64_signed.zip"
      sha256 "b8312cca4068fb5de82f0e1c31e7230df8e85aa168cfc9d7acf97021b8ff4a8b"
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
