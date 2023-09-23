


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.23.3"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.23.3/netbird-ui_0.23.3_darwin_amd64_signed.zip"
      sha256 "756680ec60a182a15a5c956cb176063736f598e6e61e891cdfa0c9456e7427f3"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.23.3/netbird-ui_0.23.3_darwin_arm64_signed.zip"
      sha256 "a0656d77850c033f312c17f27198101b67df791db9dbfd1fe8ea28eeed626d57"
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