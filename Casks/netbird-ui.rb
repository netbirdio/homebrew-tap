


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.66.4"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.66.4/netbird-ui_0.66.4_darwin_amd64_signed.zip"
      sha256 "3255a2896e6568c3be3e713e69387698979761256cb6a0bd8bcaa554aaf850e1"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.66.4/netbird-ui_0.66.4_darwin_arm64_signed.zip"
      sha256 "cd71cb13481f219c2df33e6d0caefda6905c60b2176aafbffb0cbceb473c7afe"
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
