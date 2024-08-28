


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.28.11"

  if Hardware::CPU.intel?
      url "https://github.com/mlsmaycon/netbird/releases/download/v0.28.11/netbird-ui_0.28.11_darwin_amd64_signed.zip"
      sha256 "f5ca5d3763599e1e2b3b829e43564e0a956c77c7ea21d3010ac495c678b6800d"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/mlsmaycon/netbird/releases/download/v0.28.11/netbird-ui_0.28.11_darwin_arm64_signed.zip"
      sha256 "ba317e8683ba3240122f99c24bfc40577b0b8c94299e3ea788e02399d9e0d8c5"
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