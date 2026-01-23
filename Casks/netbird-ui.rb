


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.64.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.64.1/netbird-ui_0.64.1_darwin_amd64_signed.zip"
      sha256 "7d6f4d4ccfde7bb29edea356dac1b9eb3c21905441f14ee83bd697e665461fa8"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.64.1/netbird-ui_0.64.1_darwin_arm64_signed.zip"
      sha256 "d01e33a3aa217958a4bf1ddfa237d8949a0c5adcbd1147670b7df2359d9def30"
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
