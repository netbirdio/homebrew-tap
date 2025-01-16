


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.36.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.36.1/netbird-ui_0.36.1_darwin_amd64_signed.zip"
      sha256 "557b6edfd769d6ff08cee078acd5256273c7a688b8a2a7a0d65c11b50e7a59ec"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.36.1/netbird-ui_0.36.1_darwin_arm64_signed.zip"
      sha256 "84b9bfab1fb23e20d3b13da318300810f06912b05d7cb90e3dd21188b2f46cfa"
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
