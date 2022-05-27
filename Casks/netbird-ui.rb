


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.6.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.6.1/netbird-ui_0.6.1_darwin_amd64_signed.zip"
      sha256 "4f2dcb382b3f1eb297bfc51e570848fc5cb8c4005bc07f4b06af68bb621e06f3"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.6.1/netbird-ui_0.6.1_darwin_arm64_signed.zip"
      sha256 "bda7cbe3e62527295d4268a7d31142b7b94707ef59ec07a1c3c31be61241e918"
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