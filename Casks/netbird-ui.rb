


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.59.11"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.59.11/netbird-ui_0.59.11_darwin_amd64_signed.zip"
      sha256 "4cb7c2ec65a031cd09760acc374aad1bd942e024937f0ce1283af5489dc0c5fb"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.59.11/netbird-ui_0.59.11_darwin_arm64_signed.zip"
      sha256 "5d8a6c0236b0113078098db186c4e8d61106972c0d485a0bbbff290557aa7c4f"
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
