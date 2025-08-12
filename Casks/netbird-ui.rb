


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.54.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.54.1/netbird-ui_0.54.1_darwin_amd64_signed.zip"
      sha256 "87471dee05a34465c3f9a3c41fa888762b11cfc3a0d84c72ce5cf97ee6773bd9"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.54.1/netbird-ui_0.54.1_darwin_arm64_signed.zip"
      sha256 "f8126538e1fca203497193973eefe8d9739894b2e06741cc71a027fe7a3be80f"
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
