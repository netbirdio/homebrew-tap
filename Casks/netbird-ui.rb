


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.10.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.10.1/netbird-ui_0.10.1_darwin_amd64_signed.zip"
      sha256 "dc93b1f5801777294ad0c6882d0220b7c1e1613d4676bf149e8809e736d94c0b"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.10.1/netbird-ui_0.10.1_darwin_arm64_signed.zip"
      sha256 "9871f9a92c859abc72a9a40cb6ad49a486bc9aa6dac135d0c2912d5a923dc7a6"
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