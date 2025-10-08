


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.59.4"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.59.4/netbird-ui_0.59.4_darwin_amd64_signed.zip"
      sha256 "5cb63e65cc44366fc56940fe12dd773b51d0c57a72c5932a9848e2f7b4768a9e"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.59.4/netbird-ui_0.59.4_darwin_arm64_signed.zip"
      sha256 "ba1e40b6ddd40b56ec93b22f7e5ce88476490a3efd237c548d812c3ac571745a"
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
