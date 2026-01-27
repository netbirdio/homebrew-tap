


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.64.2"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.64.2/netbird-ui_0.64.2_darwin_amd64_signed.zip"
      sha256 "364a1442009996a682e0c977cf797284f5d13cac7892487f647884fa0243256e"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.64.2/netbird-ui_0.64.2_darwin_arm64_signed.zip"
      sha256 "ab81590a231597ea05f8b2095af67f494c1780351ae6826834b13b703b710daa"
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
