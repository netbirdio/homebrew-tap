


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.21.10"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.21.10/netbird-ui_0.21.10_darwin_amd64_signed.zip"
      sha256 "1da6e3c4f4d7dbbb2e3589adca6d6355af520fc3dc95e36e53b29a2cb763dcbf"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.21.10/netbird-ui_0.21.10_darwin_arm64_signed.zip"
      sha256 "d773d19d1e51213b9ac4f02ab21ee2439c4dfe6b47ee5ef2e5ce4d4c00761a81"
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