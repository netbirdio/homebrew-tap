


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.59.10"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.59.10/netbird-ui_0.59.10_darwin_amd64_signed.zip"
      sha256 "a584d5d9a0e1fe0eab859d9de7cc4350063759c0e4aceebd3e4c1f1f5312837c"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.59.10/netbird-ui_0.59.10_darwin_arm64_signed.zip"
      sha256 "ebd888927247d04b416ea3e5ee6ae3cef553d56524d18c2442e7f60728b3b684"
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
