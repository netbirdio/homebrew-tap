


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.21.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.21.1/netbird-ui_0.21.1_darwin_amd64_signed.zip"
      sha256 "d83f4ac0da529aee5e4ea47da855f1f136946085e2b78f345de8e66d3df3b22f"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.21.1/netbird-ui_0.21.1_darwin_arm64_signed.zip"
      sha256 "9cb7386b544f3bbfbe381a2e88a50837f6404593ebc56ca84c9ce8f086e76d1f"
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