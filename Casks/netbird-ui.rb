


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.25.6"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.25.6/netbird-ui_0.25.6_darwin_amd64_signed.zip"
      sha256 "817f73fdbb90e740ba27250add6a4ee81b1d7415becb00bbe443c6236f323fb8"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.25.6/netbird-ui_0.25.6_darwin_arm64_signed.zip"
      sha256 "42b6c8921066b95613f9ebd7675447532065daf95214cc5266f3c81f49d423e1"
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