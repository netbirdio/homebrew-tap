


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.25.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.25.1/netbird-ui_0.25.1_darwin_amd64_signed.zip"
      sha256 "20199229813962505b287918da36f6b70f6adfaedd5b7e19753c0be5c99028d2"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.25.1/netbird-ui_0.25.1_darwin_arm64_signed.zip"
      sha256 "e66241f4b960c190fb081aad43c99295dce93fe62e1bff1bfd60806ac457a61e"
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