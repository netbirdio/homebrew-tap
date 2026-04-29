


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.70.3"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.70.3/netbird-ui_0.70.3_darwin_amd64_signed.zip"
      sha256 "891a8b9f8f741f1ba64e003ba7b7598363f088282f8500e05065f6f8698506e6"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.70.3/netbird-ui_0.70.3_darwin_arm64_signed.zip"
      sha256 "2c78f835318e9388e8f82db0c624927d5caedbe454d637c06c4f4ac508d66d70"
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
