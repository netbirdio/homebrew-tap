


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.52.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.52.0/netbird-ui_0.52.0_darwin_amd64_signed.zip"
      sha256 "db56928534bea0f8ed91eb5f31a3796eec523d8fa4771dcb517217c23ec2f1a8"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.52.0/netbird-ui_0.52.0_darwin_arm64_signed.zip"
      sha256 "76f2c210e77663e8d7579f1e14dae9f096f4a54b09f2c4b1f27444227e00e0ac"
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
