


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.28.8"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.28.8/netbird-ui_0.28.8_darwin_amd64_signed.zip"
      sha256 "6eb716528fd23782988bf574ea07b61ab9a05a27ce0e208203ea6b2ee3f46530"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.28.8/netbird-ui_0.28.8_darwin_arm64_signed.zip"
      sha256 "71d164c5a5de3f107e8976159b74aa9676572a8f780f294b73af8976983a086f"
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