


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.57.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.57.1/netbird-ui_0.57.1_darwin_amd64_signed.zip"
      sha256 "ab8ac6c2c0acd8adf26f517bf171cb6c9c7060fc88702cc7de52c13831f06761"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.57.1/netbird-ui_0.57.1_darwin_arm64_signed.zip"
      sha256 "b70a2706b1b586754bb15c3be99c3a7601df073397ff49db7f351f5d936ee151"
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
