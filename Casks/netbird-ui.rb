


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.35.2"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.35.2/netbird-ui_0.35.2_darwin_amd64_signed.zip"
      sha256 "9d0663a63ace8d7612a3b123f365165db1c00bf974c4b0035662ed7790c3338f"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.35.2/netbird-ui_0.35.2_darwin_arm64_signed.zip"
      sha256 "03961594c3af9adf4ce1c3909ed6023afdef6b7977ee62d3fb38be9d631c7ec7"
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
