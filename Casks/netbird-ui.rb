


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.8.4"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.8.4/netbird-ui_0.8.4_darwin_amd64_signed.zip"
      sha256 "2b16445ec4d48f01c8cf46cc3de96ec20af0b95fc0de5ffdf937ac89c4fd8997"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.8.4/netbird-ui_0.8.4_darwin_arm64_signed.zip"
      sha256 "16d5a38afa6c7aa495ce2ddcd22100d8878a3b73c2e288be8bcaa7bd50149923"
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