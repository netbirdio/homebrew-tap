


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.23.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.23.1/netbird-ui_0.23.1_darwin_amd64_signed.zip"
      sha256 "b30add26d6ddecfc896216541f80f032ef9cbab9349386defa3162dd77c8987a"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.23.1/netbird-ui_0.23.1_darwin_arm64_signed.zip"
      sha256 "50b03b5cf7d7635ea571818be10b87605c45313a8f6030a1c45886604e1d6346"
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