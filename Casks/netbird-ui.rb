


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.57.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.57.0/netbird-ui_0.57.0_darwin_amd64_signed.zip"
      sha256 "9e1779da42e707ad06d71f8d3b9add8c9fc3a465adfc8610ee151e65b1101170"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.57.0/netbird-ui_0.57.0_darwin_arm64_signed.zip"
      sha256 "cb28ca9aaaf7bb15491571caaf575fcac6de71dcea07f81502d0453041b4a3fe"
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
