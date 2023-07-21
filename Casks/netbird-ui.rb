


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.21.9"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.21.9/netbird-ui_0.21.9_darwin_amd64_signed.zip"
      sha256 "7475afdad2cc018c43cd7eb7b20152e4a1ee47e307a56eb95f65ac3cb2580c6f"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.21.9/netbird-ui_0.21.9_darwin_arm64_signed.zip"
      sha256 "6fbadeff87ecad9ea48f4e38ac56b5795bdcf02da2d78257a333f0ee4f7e0694"
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