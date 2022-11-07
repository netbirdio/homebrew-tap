


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.10.6"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.10.6/netbird-ui_0.10.6_darwin_amd64_signed.zip"
      sha256 "de009c71bd2167e0f7be216a9776e69f7b2fef3c2cfaf265989c8e4fdbde5b37"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.10.6/netbird-ui_0.10.6_darwin_arm64_signed.zip"
      sha256 "d0260308576d97d4da7fe50e1eb0d9bf1ac00f193a3a881c56572fcc9d2f8e97"
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