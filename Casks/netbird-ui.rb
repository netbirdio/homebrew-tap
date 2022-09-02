


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.8.11"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.8.11/netbird-ui_0.8.11_darwin_amd64_signed.zip"
      sha256 "17fe38d96a5cd3723679284d9e666b7f3bd3204dc2ff8f311bb8b4acb6cfd54b"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.8.11/netbird-ui_0.8.11_darwin_arm64_signed.zip"
      sha256 "348ab574246370b977a4394d5b076b8658afeea77e5c8a77376bb1c49dd8abd4"
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