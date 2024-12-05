


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.34.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.34.1/netbird-ui_0.34.1_darwin_amd64_signed.zip"
      sha256 "0e84bc70dc08e0efb8ee00f3e48e0edb7fa53967b9c10bebac9cf8c106a863f4"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.34.1/netbird-ui_0.34.1_darwin_arm64_signed.zip"
      sha256 "70fa078c8f3cc21bb02fe579450c49215bb6e20b32e87f173bc30e378faa174f"
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
