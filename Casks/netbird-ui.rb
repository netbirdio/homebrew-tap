


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.28.5"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.28.5/netbird-ui_0.28.5_darwin_amd64_signed.zip"
      sha256 "bf62a6b6afd01fba46b8337bec34dd3203e8f4621a957ce05d1a1690c9ef4796"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.28.5/netbird-ui_0.28.5_darwin_arm64_signed.zip"
      sha256 "befdb189508af2db63176105ede34feba21bb4ec792f52fe0b9753e1f2f1ffc2"
      app "netbird_ui_darwin_arm64", target: "Netbird UI.app"
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