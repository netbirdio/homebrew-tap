


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.11.3"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.11.3/netbird-ui_0.11.3_darwin_amd64_signed.zip"
      sha256 "c8d83704c02ed9ab4c47f81bc222aa0b08d48ef26e11ba0e8bde5d6a0304f19b"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.11.3/netbird-ui_0.11.3_darwin_arm64_signed.zip"
      sha256 "520a2970b07cea516188c3ffce1c92d6df01ab1707029d94adb333e3c2d0ccfa"
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