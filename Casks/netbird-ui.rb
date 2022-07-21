


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.8.3"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.8.3/netbird-ui_0.8.3_darwin_amd64_signed.zip"
      sha256 "17f8a15a9e61511ed2a94e925424241466a45155033f3ed77840cb92350edc68"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.8.3/netbird-ui_0.8.3_darwin_arm64_signed.zip"
      sha256 "9441dda22f2aa54765f03322547d82235dfc217f4800b4488098f1fdaf95c1c5"
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