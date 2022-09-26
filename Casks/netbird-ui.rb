


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.9.5"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.9.5/netbird-ui_0.9.5_darwin_amd64_signed.zip"
      sha256 "90594eaf91a98f4448a9dffcc5e54a1634ecb134520ce93d794c8d3dd2ed39d9"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.9.5/netbird-ui_0.9.5_darwin_arm64_signed.zip"
      sha256 "179e69b45ec3fd939234923dd84b12a4e7dcb20b391ee45d2f0c0fce0d5394b3"
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