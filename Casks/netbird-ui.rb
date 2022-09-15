


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.9.3"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.9.3/netbird-ui_0.9.3_darwin_amd64_signed.zip"
      sha256 "78ff1ed8a964311efd4ddca2b1f4125d60d6fa4873facdb8bf571cbbc9bbea65"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.9.3/netbird-ui_0.9.3_darwin_arm64_signed.zip"
      sha256 "8c4e02754190e74001c7870466f0ef6acd01ef2c6e6bfb2185eb0e2dd9df2843"
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