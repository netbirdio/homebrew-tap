


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.18.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.18.1/netbird-ui_0.18.1_darwin_amd64_signed.zip"
      sha256 "84eabbaa4c2df427ab00c7194550e9cc43c42efb9650ea1b2a090f0ef2faa99b"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.18.1/netbird-ui_0.18.1_darwin_arm64_signed.zip"
      sha256 "d1acfeee0a67fe36b445d24f0c682e29ee3de1d378319edcbf2870baaca3365f"
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