


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.14.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.14.0/netbird-ui_0.14.0_darwin_amd64_signed.zip"
      sha256 "4d553cb5143e78659376dd14b95e84ecab721a505667942c3449b53c715c1944"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.14.0/netbird-ui_0.14.0_darwin_arm64_signed.zip"
      sha256 "65b18216fbc9ed5611a34192506352f70d1de66240c12138a45c1ecf830c1b22"
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