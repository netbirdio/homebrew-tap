


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.36.2"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.36.2/netbird-ui_0.36.2_darwin_amd64_signed.zip"
      sha256 "1c5576b0af8882b0a860dca89906d5d09b1df83846b64e4605c96bdbab1480f5"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.36.2/netbird-ui_0.36.2_darwin_arm64_signed.zip"
      sha256 "a14d77e04275067d1c1c4636e6184263dd6d35220b497e55a0763c21817ec476"
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
