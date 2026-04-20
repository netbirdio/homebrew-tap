


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.69.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.69.0/netbird-ui_0.69.0_darwin_amd64_signed.zip"
      sha256 "20dc4463f2bf4981afff90ef89b96ec0197907af77e23c475443951fe61db7fb"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.69.0/netbird-ui_0.69.0_darwin_arm64_signed.zip"
      sha256 "3ceda8fef38261addc8fbfe217cd173cc0a8e58b336e634fed4fba20de294188"
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
