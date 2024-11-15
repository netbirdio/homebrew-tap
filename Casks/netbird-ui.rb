


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.32.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.32.0/netbird-ui_0.32.0_darwin_amd64_signed.zip"
      sha256 "4115f8349903e775315fad4ef949296e3d0a5135a997ea502b4f1dc1d1edd737"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.32.0/netbird-ui_0.32.0_darwin_arm64_signed.zip"
      sha256 "d0b912731fd3b8e567bac4a7c58ab6965c2b43f5251895c39591af02423db5a4"
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
