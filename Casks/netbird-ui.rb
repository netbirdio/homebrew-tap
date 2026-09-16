


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.78.2"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.78.2/netbird-ui_0.78.2_darwin_amd64_signed.zip"
      sha256 "2cea7b4c4e49a6f24a230f1b41a7bcb6f7368f7c3d52bd4271e62c9448154191"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.78.2/netbird-ui_0.78.2_darwin_arm64_signed.zip"
      sha256 "36bf1481d04abed388dcf356462ac9f6ce60c56503bbf9058a30c0dcd693a864"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  end

  depends_on formula: "netbird"

  postflight_steps do
    run "/bin/chmod", args: ["0755", "{{appdir}}/Netbird UI.app/installer.sh", "{{appdir}}/Netbird UI.app/uninstaller.sh"]
    run "{{appdir}}/Netbird UI.app/installer.sh", args: ["#{version}"], sudo: true
  end

  uninstall_preflight_steps do
    run "/bin/launchctl", args: ["bootout", "system/netbird"], sudo: true, must_succeed: false
    run "/bin/rm", args: ["-f", "/Library/LaunchDaemons/netbird.plist"], sudo: true
  end

  name "Netbird UI"
  desc "Netbird UI Client"
  homepage "https://www.netbird.io/"
end
