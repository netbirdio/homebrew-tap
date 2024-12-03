


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.34.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.34.0/netbird-ui_0.34.0_darwin_amd64_signed.zip"
      sha256 "33ac340bd371889c4a6bbc210d766c8fb3aac8fa389856fc6ed89a1d928d4200"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.34.0/netbird-ui_0.34.0_darwin_arm64_signed.zip"
      sha256 "efb93b47fda82ea11740c71f17a1047e50f188dc70e371b1a6225e1e24bde6a8"
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
